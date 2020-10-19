# jenkins-ci-template
Template to have a Jenkins server with some examples using pipeline.



## Jenkins Theme

### Option A: using themeManager plugin

You can change the the used for this template editing the file: `jenkins/jenkins-config.yaml` in the section:

```yaml
unclassified:
  themeManager:
    disableUserThemes: false
    theme: "dark"
```

The list of available theme are: `dark`, `darkSystem`, `noOp`, `material-indigo`, `material-red`, `solarizedSystem`, `solarizedDark` and `solarizedLight`.

### Option B: using simple-theme-plugin

Also you can use a custom theme, for this I used the generator [jenkins-material-theme](http://afonsof.com/jenkins-material-theme/)

```yaml
unclassified:
  simple-theme-plugin:
    elements:
    - cssUrl:
        url: "http://localhost:8080/userContent/jenkins-material-theme.css"
    - faviconUrl:
        url: "http://localhost:8080/userContent/favicon.ico"
```
**Note:** If the jenkins domain change, should be update the url used in the theme configuration.
