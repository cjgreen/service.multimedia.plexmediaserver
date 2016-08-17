var ar = require('ar'),
    fs = require('fs'),
    path = require('path');

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
            extractLib: {
                options: {
                    mode: true
                },
                expand: true,
                cwd: 'temp/PlexMediaServer/usr/lib/plexmediaserver/',
                src: '**',
                dest: 'temp/<%= pkg.name %>/lib'
            }
        },
        plex: grunt.file.readJSON(process.env.HOME + '/.plex'), // Read personal plex token from config file
        curl: {
            download: {
                src: 'https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu&X-Plex-Token=<%= plex.XPlexToken %>',
                dest: 'temp/PlexMediaServer.deb'
            }
        },
        untar: {
            extractPlex: {
                src: 'temp/PlexMediaServer/data.tar.gz',
                dest: 'temp/PlexMediaServer'
            }
        },
        compress: {
            zip: {
                options: {
                    archive: 'build/<%= pkg.name %>-<%= pkg.version %>.zip',
                    level: 9
                },
                expand: true,
                cwd: 'temp/<%= pkg.name %>/',
                src: ['**', '!**/*.DS_Store', '!**/dsm_config/**'],
                dest: '<%= pkg.name %>/'
            }
        }
    });

    grunt.registerTask('extractDeb', function() {
        var outputDir = 'temp/PlexMediaServer';
        if (!fs.existsSync(outputDir)) fs.mkdirSync(outputDir);
        var archive = new ar.Archive(fs.readFileSync('temp/PlexMediaServer.deb'));
        var files = archive.getFiles();
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            fs.writeFileSync(path.resolve(outputDir, file.name()), file.fileData());
        }
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-curl');
    grunt.loadNpmTasks('grunt-untar');
    grunt.loadNpmTasks('grunt-contrib-compress');

    grunt.registerTask('default', ['clean:build', 'copy:source', 'curl:download', 'extractDeb', 'untar:extractPlex', 'copy:extractLib', 'compress:zip', 'clean:temp']);
};
