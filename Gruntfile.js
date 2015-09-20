var fs = require('fs');
var fstream = require('fstream');
var tar = require('tar');
var zlib = require('zlib');
var archiver = require('archiver');

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
        var pkg = grunt.config('pkg');
        fs.createReadStream('temp/PlexMediaServer.tar')
        .pipe(tar.Extract({ path: 'temp/PlexMediaServer' }))
        .on('error', function(err) {
            console.log('Failed to extract temp/PlexMediaServer.tar to temp/PlexMediaServer');
            grunt.fail.fatal(err);
        })
        .on('end', function() {
            fs.createReadStream('temp/PlexMediaServer/package.tgz')
            .pipe(zlib.createGunzip())
            .pipe(tar.Extract({ path: 'temp/' + pkg.name + '/lib' }))
            .on('error', function(err) {
                console.log('Failed to extract temp/PlexMediaServer/package.tgz to temp/' + pkg.name + '/lib');
                grunt.fail.fatal(err);
            })
            .on('end', done);
        });
    });

    grunt.registerTask('compress', function() {
        var done = this.async();
        var pkg = grunt.config('pkg');
        var archive = archiver('zip');
        archive.pipe(fs.createWriteStream('build/' + pkg.name + '-' + pkg.version + '.zip').on('close', done));
        archive.on('error', function(err) {
            console.log('Failed to compress temp/' + pkg.name + ' to build/' + pkg.name + '-' + pkg.version + '.zip');
            grunt.fail.fatal(err);
        });

        var onEntry = function(entry) {
            if (entry.type === 'Directory') return entry.on('entry', onEntry);
            var fileName = entry.path.split(pkg.name)[2];
            archive.append(entry, { name: fileName }, function(err) {
                if (!err) return;
                console.log('Failed to add ' + fileName + ' to archive');
                grunt.fail.fatal(err);
            });
        }

        fstream.Reader({ 'path': 'temp/' + pkg.name, 'type': 'Directory'})
        .on('entry', onEntry)
        .on('error', function(err) {
            console.log('Failed to read temp/' + pkg.name);
            grunt.fail.fatal(err);
        })
        .on('end', function() {
            archive.finalize();
        });
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-curl');

    grunt.registerTask('default', ['clean:build', 'copy', 'curl', 'extract', 'compress', 'clean:temp']);
};
