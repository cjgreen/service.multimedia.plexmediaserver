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
        untar: {
            extractPlex: {
                src: 'temp/PlexMediaServer.tar',
                dest: 'temp/PlexMediaServer'
            },
            extractLib: {
                src: 'temp/PlexMediaServer/package.tgz',
                dest: 'temp/<%= pkg.name %>/lib'
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

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-curl');
    grunt.loadNpmTasks('grunt-untar');
    grunt.loadNpmTasks('grunt-contrib-compress');

    grunt.registerTask('default', ['clean:build', 'copy', 'curl', 'untar:extractPlex', 'untar:extractLib', 'compress', 'clean:temp']);
};
