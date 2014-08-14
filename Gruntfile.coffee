module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffee:
      options:
        sourceMap: no
      dist:
        files: [{
          expand: yes
          cwd: 'src'
          src: [ '**/*.coffee' ]
          dest: 'dist'
          ext: '.js'
        }]

    compass:
      options:
        noLineComments: true
        outputStyle: 'expanded'
        assetCacheBuster: true
      dist:
        options:
          sassDir: 'src'
          cssDir: 'dist'
    
    jade:
      options:
        debug: false
      dist:
        files: [{
          expand: yes
          cwd: 'src'
          src: [ '**/*.jade' ]
          dest: 'dist'
          ext: '.html'
        }]

    watch:
      options:
        dateFormat: (time) ->
          grunt.log.writeln "The watch finished in #{time}ms at #{new Date().toLocaleTimeString()}"
      coffee:
        files: ['src/*.coffee']
        tasks: ['coffee']
      jade: 
        files: ['src/*.jade']
        tasks: ['jade']
      compass:
        files: ['src/*.{sass,scss}']
        tasks: ['compass']

  # compile
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  # watch
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'build', ['coffee', 'jade', 'compass']
  grunt.registerTask 'default', ['build', 'watch']
