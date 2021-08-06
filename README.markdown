# Walpurgisbox
Collection of terminal tools and aliases

## Usage

### Rename-regex
args: `(dir '.') regex new`  
Rename files with regex  
```
$ pls rename-regex .txt .exmp 
```

### Truncate-name
args: `(dir '.') regex`  
Cut out part of the files names with regex 
```
$ pls truncate-name .exmp
```

### Subst-in
args: `(dir '.') regex new (regex or all)`  
Replace substring in specified files including ones in subdirectories with regex
```
$ pls subst-in 'old-string' 'new' *.lisp
```

### Unique-lines
args: `&rest files`  
Count unique lines in specified files  
```
$ pls unique-lines *
```

### Count-lines
args: `(dir '.') (regex or all)`  
Count lines in specified files including ones in subdirectories.
```
$ pls count-lines all
1472481
$ pls count-lines app *.rb
37287
```

### URL-encoding
Simple encode
```
$ pls url-encode '/foo<bar>'
%2Ffoo%3Cbar%3E
```
Double encode
```
$ pls url-double-encode '/foo"bar"'
%252Ffoo%2522bar%2522
```
Decoding
```
$ pls url-decode '%2Ffoo%3Cbar%3E'
/foo<bar>
$ pls url-double-decode '%252Ffoo%2522bar%2522'
/foo"bar"
```

## Installation
```
ros install walpurgisnatch/walpurgisbox
```

After it add an appropriate alias in your `.bashrc` file
```
alias pls="walpurgisbox"
```
