# Walpurgisbox
Collection of terminal tools and aliases

## Usage

### Rename-regex
args `(dir '.') regex new`  
Rename files with regex  
```
$ pls rename-regex .txt .exmp 
```

### Truncate-name
args `(dir '.') regex`  
Cut out part of the files names with regex 
```
$ pls truncate-name .exmp
```

### Subst-in
args `regex new &rest files`  
Replace substring in specified files with regex  
```
$ pls subst-in 'old-string' 'new' file1 file2
```

### Unique-lines
args `&rest files`  
Count unique lines in specified files  
```
$ pls unique-lines *
```

### Count-lines
args `(dir '.') (regex or all)`
Count lines in files including subdirectories.
```
$ pls count-lines all
1472481
$ pls count-lines app *.rb
37287
```

## Installation
```
ros install walpurgisnatch/walpurgisbox
```

After it add an appropriate alias in your `.bashrc` file
```
alias pls="walpurgisbox"
```
