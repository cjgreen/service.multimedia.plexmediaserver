var tarball = require('tarball-extract');

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
        },
        compress: {
            zip: {
                options: {
                    archive: 'build/<%= pkg.name %>-<%= pkg.version %>.zip'
                },
                expand: true,
                cwd: 'temp/',
                src: ['<%= pkg.name %>/**', '!**/<%= pkg.name %>/lib/dsm_config/**']
            }
        }
    });

    grunt.registerTask('extract', function() {
        var done = this.async();
        tarball.extractTarball('temp/PlexMediaServer.tar', 'temp/PlexMediaServer', function(err) {
            if (err) grunt.fail.fatal('Failed to extract temp/PlexMediaServer.tar: ' + err);
            tarball.extractTarball('temp/PlexMediaServer/package.tgz', 'temp/'+grunt.config('pkg.name')+'/lib', function(err) {
                if (err) grunt.fail.fatal('Failed to extract temp/PlexMediaServer/package.tgz: ' + err);
                done();
            });
        });
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-curl');
    grunt.loadNpmTasks('grunt-contrib-compress');

    grunt.registerTask('default', ['clean:build', 'copy', 'curl', 'extract', 'compress', 'clean:temp']);
};
