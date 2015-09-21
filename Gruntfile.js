var fs = require('fs');
var fstream = require('fstream');
var tar = require('tar');
var zlib = require('zlib');
var archiver = require('archiver');
var mkdirp = require('mkdirp');

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
        var root = process.cwd();
        var dir = './temp/PlexMediaServer';
        mkdirp.sync(dir, function(err) {
            if (err) {
                console.error('Failed to create the directory ' + dir);
                grunt.fail.fatal(err);
            }
        });
        process.chdir(dir);
        fs.createReadStream('../PlexMediaServer.tar')
        .pipe(tar.Extract({
            path: './'
        }))
        .on('error', function(err) {
            console.error('Failed to extract temp/PlexMediaServer.tar to temp/PlexMediaServer');
            grunt.fail.fatal(err);
        })
        .on('end', function() {
            dir = '../'+pkg.name+'/lib';
            mkdirp.sync(dir, function(err) {
                if (err) {
                    console.error('Failed to create the directory ' + dir);
                    grunt.fail.fatal(err);
                }
            });
            process.chdir(dir);
            fs.createReadStream('../../PlexMediaServer/package.tgz')
            .pipe(zlib.createGunzip())
            .pipe(tar.Extract({
                path: './'
            }))
            .on('error', function(err) {
                console.error('Failed to extract temp/PlexMediaServer/package.tgz to temp/' + pkg.name + '/lib');
                grunt.fail.fatal(err);
            })
            .on('end', function() {
                process.chdir(root);
                done();
            });
        });
    });

    grunt.registerTask('compress', function() {
        var done = this.async();
        var pkg = grunt.config('pkg');
        var archive = archiver('zip', {
            zlib: {
                level: 9
            }
        });
        archive.pipe(fstream.Writer({ path: 'build/' + pkg.name + '-' + pkg.version + '.zip' }).on('close', done));
        archive.on('error', function(err) {
            console.error('Failed to compress temp/' + pkg.name + ' to build/' + pkg.name + '-' + pkg.version + '.zip');
            grunt.fail.fatal(err);
        });

        var onEntry = function(entry) {
            if (entry.type === 'Directory') return entry.on('entry', onEntry);
            var fileName = entry.path.split(pkg.name)[2];
            archive.append(entry, {
                name: fileName,
                stats: entry.props
            }, function(err) {
                if (err) {
                    console.error('Failed to add ' + fileName + ' to archive');
                    grunt.fail.fatal(err);
                }
            });
        }

        fstream.Reader({
            'path': 'temp/' + pkg.name,
            filter: function () {
                return !this.basename.match(/^dsm_config$/) && !this.basename.match(/^.DS_Store$/);
            }
        })
        .on('entry', onEntry)
        .on('error', function(err) {
            console.error('Failed to read temp/' + pkg.name);
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
