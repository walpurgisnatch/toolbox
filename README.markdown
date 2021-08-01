# Walpurgisbox
Collection of terminal tools and aliases

## Usage

### Rename-regex
Rename files with regex | (dir '.') regex new  
```
$ pls rename-regex .txt .exmp 
```

### Truncate-name
Cut out part of the files names with regex | (dir '.') regex
```
$ pls truncate-name .exmp
```

### Subst-in
Replace substring in specified files with regex | regex new &rest files
```
$ pls subst-in 'old-string' 'new' file1 file2
```

### Countli
Count unique lines in specified files | &rest files
```
$ pls countli *
```

## Installation
```
ros install walpurgisnatch/walpurgisbox
```

After it add an appropriate alias in your `.bashrc` file
```
alias pls="walpurgisbox"
```
