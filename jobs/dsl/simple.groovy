folder('Examples') {
    displayName('Examples')
    description('Examples folder for projects')
}


job('Examples/Example 1') {
    description('Hello world')
    steps {
        shell('''
        	echo "hello world"
    	'''.stripIndent())
    }
}
