module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

      uglify: {
        dev: {
          options: {
            beautify: true,
            mangle: false
          },
          files: {
            "html/js/main.js": "build/js/main.js"
          },
        },
        prod: {
          options: {
            beautify: true,
            banner: '/*! last updated <%= grunt.template.today("yyyy-mm-dd") %> */\n',
            mangle: {
              except:['jQuery'],
            }
          },
          files: {
            "html/js/main.js": "build/js/main.js"
          },
        },
      },

      htmlmin: {                                     // Task
        dev: {                                       // Another target
          files: {
            'html/index.html': 'build/index.html',
          },
        },
        prod: {                                      // Target
          options: {                                 // Target options
            removeComments: true,
            collapseWhitespace: true
          },
          files: {                                   // Dictionary of files
            'html/index.hml': 'build/index.html',
          },
        },
      },

      // image optimazations
      imagemin: {                          // Task
        dev: {                         // Another target
          options: {                       // Target options
            optimizationLevel: 1,
            pngquant: true
          },
          files: [{
            expand: true,                  // Enable dynamic expansion
            cwd: 'build/img',                   // Src matches are relative to this path
            src: ['**/*.{png,jpg,gif}'],   // Actual patterns to match
            dest: 'html/img/'                  // Destination path prefix
          }]
        }
      },

      jshint: {
        files: ['build/js/*.js'],
        options: {
          curly: true,
          eqeqeq: true,
          eqnull: true,
          browser: true,
          globals: {
            jQuery: true
          }
        }
      },

      svgmin: {                       // Task
        options: {                  // Configuration that will be passed directly to SVGO
            plugins: [{
                removeViewBox: false
            }]
        },
        dev: {                     // Target
            files: [{               // Dictionary of files
                expand: true,       // Enable dynamic expansion.
                cwd: 'build/img',     // Src matches are relative to this path.
                src: ['**/*.svg'],  // Actual pattern(s) to match.
                dest: 'html/img/',       // Destination path prefix.
                ext: '.svg'     // Dest filepaths will have this extension.
                // ie: optimise img/src/branding/logo.svg and store it in img/branding/logo.min.svg
            }]
          }
      },

      cssmin: {
        add_banner: {
          options: {
            banner: '/* updated <%= grunt.template.today("yyyy-mm-dd") %> */'
          },
          files: {
            'html/stylesheets/screen.css': ['stylesheets/*.css']
          }
        }
      },

      compass: {                  // Task
        default: {                    // Another target
          options: {
            config: 'config.rb'
          }
        }
      },

      validation: {
        options: {
                reset: grunt.option('reset') || false,
                stoponerror: false,
                relaxerror: ["Bad value X-UA-Compatible for attribute http-equiv on element meta."]
        },
        files: {
                src: ['html/**/*.html','! node_modules/**/*.html']
        }
      },

      watch: {
        set1: {
          files: ['build/js/*.js', 'build/sass/**/*.scss', 'build/img/**/*.png','build/img/**/*.jpg','build/img/**/*.gif','build/img/**/*.svg','build/**/*.html'],
          tasks: ['build'],
          options: {
            livereload : true,
            spawn: false
          },
        },
        set2:{
          files: ['build/img/**/*.png','build/img/**/*.jpg','build/img/**/*.gif','build/img/**/*.svg'],
          tasks: ['images'],
          options: {
            livereload : true,
            spawn: false
          },
        },
      }
  });

  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-htmlmin');
  grunt.loadNpmTasks('grunt-html-validation');
  grunt.loadNpmTasks('grunt-contrib-htmlmin');
  grunt.loadNpmTasks('grunt-newer');

  // Default tasks
  grunt.registerTask('build', ['jshint','newer:uglify:dev','compass']);
  grunt.registerTask('prod', ['imagemin','svgmin','compass','cssmin','uglify:prod','htmlmin:prod']);

  grunt.registerTask('images', [], function () {
    grunt.loadNpmTasks('grunt-contrib-imagemin');
    grunt.loadNpmTasks('grunt-svgmin');
    grunt.task.run('newer:imagemin','newer:svgmin');
});

  // Custom tasks
  grunt.registerTask("validate", ['validation']);
  grunt.registerTask("img", ['imagemin','svgmin']);

  //watchs
  grunt.registerTask('watchSetBuild', ['watch:set1','watch:set2']);


  // run grunt watch to run build every time a file changes
  // grunt.event.on('watch', function(action, filepath) {
  //   grunt.log.writeln(filepath + ' has ' + action);
  // });

};
