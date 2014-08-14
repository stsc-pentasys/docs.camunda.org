camunda BPM Documentation
=========================

This repository contains the sources of the [camunda BPM doumentation](http://docs.camunda.org).

The page is built using the [DocPad web framework](http://docpad.org).

Overview
--------

The `site/src/` folder contains the sources for the website.


Start hacking
-------------

In order to start hacking the docs.camunda.org site, you first need to setup DocPad:

1. Install [node.js](http://nodejs.org/).
2. Open a terminal, navigate to the `site/` folder and type `npm install`.
3. Optional: Install docpad via `npm install -g docpad` if you want to have it globally available in your path.

Once all tools are installed, you can build the site:

1. Open a terminal, navigate to the `site/` folder and type `npm update`.
2. Run DocPad using `./node_modules/.bin/docpad run` or just `docpad run` if you installed it globally.
3. Go to [http://localhost:9779/](http://localhost:9779/).

Have fun.


Modifying content
-----------------

To modify content of a page, you can use our awesome hacking optionz

1. Open a page to modify
2. Enable _editing_ mode by hitting **Ctrl** and **e**   
  a) Alternatively, you can open the _editing_ mode in a seperate window by hitting **Ctrl**, **Alt** and **e**
3. _Save_ your changes by hitting **Ctrl** and **s**
4. Leave _editing mode_ by hitting **Ctrl** and **e**
5. Inspect the changes you made and slap the monkey


Writing documentation
---------------------

Whenever possible, documentation should be written in [Markdown](http://daringfireball.net/projects/markdown/)

Please use US English and perform a spell check before committing.

Some special notes on how to write it (view the source of this document for the actual markdown source code): 



### Code

```
Use a sequence of three backticks (```) in the lines before and after your code.
```

When used 

* During an enumeration, indent the code (including the backticks)

  ```
  Like this to let the code block be properly rendered as part of the enum item.
  ```

  and to allow other text to follow after the code snipped as part of the enum, too.


### Spacing of elements

Use a single empty line between enumerations / paragraphs / headings / code snippets.

Use a double empty line before headings to make a document more readable.


### When to use HTML markup

Use HTML markup with [twitter bootstrap flavour](http://twitter.github.io/bootstrap/)

* for [notes](http://twitter.github.io/bootstrap/components.html#alerts)

  ```
  <div class="{alert|info|error|success}">
    <strong>{summary}</strong> {description message}
  </div>
  ```

* for [tables](http://twitter.github.io/bootstrap/base-css.html#tables)

  ```
  <table class="table">
    <thead>
      <tr>
        <th>col2</th>
        <th>col1</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>foo</td>
        <td>bar</td>
      </tr>
      <tr>
        <td>asdf</td>
        <td>gh</td>
      </tr>
    </tbody>
  </table>
  ```


License
-------
![CC BY-SA](http://i.creativecommons.org/l/by-sa/3.0/80x15.png)
The content on this project is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).
