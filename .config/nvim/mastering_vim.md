## Helpful Tips

* Delete up until the first search match for “rails”: `d/rails`
* Use netrw w/ customizations to do file browsing.
* Rotate windows left-to-right (in vertical split): `Ctrl-w r`
* Execute the macro stored in register m on all lines: `:%norm @m`
* Execute the macro stored in register o on all lines matching pattern:
  `:g/pattern/norm @o`

You can run commands across visual selection just like you’re running them in
Normal mode. Let’s say we have the following lines written in Perl and we
forgot to append ; to each of them:

```
my $a
my $b
my $c
```

We can visually select all 3 lines using Shift-v, and then run command:

```
:normal A;
```

This will execute a command A; (append ; to the end of a line) for each line.
If you’d like to run the same command over the entire file content, you could
run:

```
:%normal A;
```

Delete buffer w/o closing window: `bp|bd #` (buffer previous, and then delete `#` alternate file)

### Make splits full height/width
* Use `Ctrl-w _` to make a split full height. Use `Ctrl-w |` to make a split
  full width. Use `Ctrl-w =` to equalise all sizes.

* Use `Ctrl-w q` to quit a split

* User `:on` or `<C-w> o` to make the current split the only window


### Word wrapping

```
set tw=80
set wrap
```

### Operating on search matches using gn


http://vimcasts.org/episodes/operating-on-search-matches-using-gn/


### Deleting a buffer by number
If a buffer has a number `5`, we can delete it using `:5bw` (or `:5bw!` to
force).

