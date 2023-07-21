
- link yabairc and skhrc to ~/.yabairc and ~/.skhrc respectively
- run shkd --install-service two times to get the file name the second time, and add 

```
        <key>SHELL</key>
        <string>/bin/bash</string>
```

in the EnvironmentVariables section.

- run skhd --start-service
