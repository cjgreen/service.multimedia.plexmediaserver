module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        compress: {
            zip: {
                options: {
                    archive: 'build/<%= pkg.name %>-<%= pkg.version %>.zip'
                },
                src: ['<%= pkg.name %>/**', '!<%= pkg.name %>/**/*.DS_Store'],
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-compress');

    grunt.registerTask('default', ['compress']);
};
