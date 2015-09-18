var tarball = require('tarball-extract');
var fstream = require('fstream');
var tar = require('tar');
var zlib = require('zlib');

module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        clean: {
            build: 'build',
            temp: 'temp'
        },
        copy: {
            source: {
                options: {
                    mode: true
                },
                expand: true,
                cwd: 'source/',
                src: ['**', '!**/*.DS_Store'],
                dest: 'temp/<%= pkg.name %>'
            },
        },
        plex: grunt.file.readJSON(process.env.HOME + '/.plex'), // Read personal plex token from config file
        curl: {
            download: {
                src: 'https://plex.tv/downloads/latest/1?channel=8&build=linux-synology-arm7&distro=synology&X-Plex-Token=<%= plex.XPlexToken %>',
                dest: 'temp/PlexMediaServer.tar'
            }
        }
    });

    grunt.registerTask('extract', function() {
        var done = this.async();
        tarball.extractTarball('temp/PlexMediaServer.tar', 'temp/PlexMediaServer', function(err) {
            if (err) {
                console.log('Failed to extract temp/PlexMediaServer.tar to temp/PlexMediaServer');
                grunt.fail.fatal(err);
            }
            tarball.extractTarball('temp/PlexMediaServer/package.tgz', 'temp/PlexMediaServer/package', function(err) {
                if (err) {
                    console.log('Failed to extract temp/PlexMediaServer/package.tgz to temp/PlexMediaServer/package');
                    grunt.fail.fatal(err);
                }
                done();
            });
        });
    });

    grunt.registerTask('copyPlexLib', function() {
        var done = this.async();
        var pkg = grunt.config('pkg');
        fstream.Reader({ 'path': 'temp/PlexMediaServer/package', 'type': 'Directory' })
        .pipe(fstream.Writer({ 'path': 'temp/'+pkg.name+'/lib', 'type': 'Directory' }))
        .on('error', function(err) {
            console.log('Failed to copy temp/PlexMediaServer/package to temp/'+pkg.name+'/lib');
            grunt.fail.fatal(err);
        })
        .on('end', function() {
            done();
        });
    });

    grunt.registerTask('compress', function() {
        var done = this.async();
        var pkg = grunt.config('pkg');
        fstream.Reader({ 'path': 'temp/'+pkg.name, 'type': 'Directory' })
        .pipe(tar.Pack())
        .pipe(zlib.Gzip())
        .pipe(fstream.Writer({ 'path': 'build/'+pkg.name+'-'+pkg.version+'.tar.gz' }))
        .on('error', function(err) {
            console.log('Failed to compress temp/'+pkg.name+' to build/'+pkg.name+'-'+pkg.version+'.tar.gz');
            grunt.fail.fatal(err);
        })
        .on('end', function() {
            done();
        });
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-curl');

    grunt.registerTask('default', ['clean:build', 'copy', 'curl', 'extract', 'copyPlexLib', 'compress', 'clean:temp']);
};
