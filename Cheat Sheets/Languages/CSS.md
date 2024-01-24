## Ressources

- [CSS Layouts Introduction](http://learnlayout.com/)
- [JSFiddle - Javascript Online IDE](http://jsfiddle.net)
- Standard Clearfix

        .clearfix::after {
          content: "";
          clear: both;
          display: table;
        }

- External Link Indicators

        // Set for all links
        .content a[href^="//"]:after, 
        .content a[href^="http://"]:after, 
        .content a[href^="https://"]:after {
            content: url(/images/Icon_External_Link.png);
            margin: 0 0 0 5px;
        }

        // Exclude local links
        .content a[href^="//lzone.de/"]:after, 
        .content a[href^="http://lzone.de/"]:after, 
        .content a[href^="https://lzone.de/"]:after {
            content: '';
            margin: 0;
        }

- Image Inlining

        <img src="data:image/png;base64,[IMAGE_DATA_STRING]" />

- CSS Pre-Processors
   - [Less](http://lesscss.org)
   - [Sass](http://sass-lang.com)
   - [Stylus](https://learnboost.github.io/stylus/)

## Advanced CSS Style Overview

<table>
<tr><td>CSS 1</td><td>No Wrapping		</td><td><pre>white-space: nowrap;</pre></td></tr>
<tr><td>CSS 1</td><td>Inline Block Layout	</td><td><pre>display: inline-block;</pre></td></tr>
<tr><td>CSS 2</td><td>Max Width			</td><td><pre>max-width: 1024px;</pre></td></tr>
<tr><td>CSS 2</td><td>Table - Border Collapse	</td><td><pre>border-collapse: collapse</pre></td></tr>
<tr><td>CSS 2</td><td>Insert Before/After       </td><td><pre>p.chapter:before { content: 'something'; }

a.href[href^="http://"]:after {
   content: url(/images/Icon_External_Link.png);
}
</pre></td></tr>
<tr><td>CSS 3</td><td>nth Child                 </td><td><pre>tr:nth-child(odd) { }
tr:nth-child(even) { }
tr:nth-child(5) { }       // just the 5th
tr:nth-child(2n+3) { }    // every 2nd starting at 3
tr:nth-child(-n+4) { }    // first 4
</pre></td></tr>
<tr><td>CSS 3</td><td>Media Queries             </td><td><pre>&lt;link rel="stylesheet" media="(max-width: 800px)" href="example.css" />
</pre>
<pre>
@media (min-width: 400px) { }
@media (max-width: 600px) { }
@media (max-width: 600px) and (orientation: landscape) { }
@media screen and (min-aspect-ratio: 16/9) { }
@media print and (min-resolution: 300dpi) { }
</pre>
</pre></td></tr>
<tr><td>CSS 3</td><td>View Port</td><td><pre>
&lt;meta name="viewport" content="width=320" />

@-viewport { width: 640px; }

@-ms-viewport { width: device-width }

@media (max-width: 699px) and (min-width: 520px) {
  @-viewport {
    width: 640px;
  }
}

@viewport {
    width: 980px;
    min-zoom: 0.25;
    max-zoom: 5;
    orientation: landscape;
}
</pre></td></tr>
<tr><td>CSS 3</td><td>Background Gradient	</td><td><pre>
background: -webkit-linear-gradient(#444, #000);
background: -o-linear-gradient(#444, #000);
background: -moz-linear-gradient(#444, #000);
background: linear-gradient(#444, #000);
</pre></td></tr>
<tr><td>CSS 3</td><td>Border Radis		</td><td><pre>
border-radius: 6px;
border-top-left-radius: 6px;
border-top-right-radius: 6px;
border-bottom-right-radius: 6px;
border-bottom-left-radius: 6px; 
</pre></td></tr>
<tr><td>CSS 3</td><td>div - Colum Count			</td><td><pre>
-webkit-column-count: 3;
-moz-column-count: 3;
column-count: 3;
</pre></td></tr>

<tr><td>CSS 3</td><td>Animations			</td><td><pre>
animation-name: spin; 
animation-duration: 5s;
animation-iteration-count: infinite; 
animation-timing-function: linear;
</pre></td></tr>

<tr><td>CSS 3</td><td>Circle Drawing			</td><td>
Circles are done using a 50% border radius
<pre>
border-radius:50%;
</pre></td></tr>

<tr><td>Draft</td><td><a href="http://css-tricks.com/snippets/css/a-guide-to-flexbox/">Flexbox</a></td><td><pre>
display: flex;
flex-direction: &lt;row | row-reverse | column | column-reverse>;
flex-wrap: &lt;nowrap | wrap | wrap-reverse>;
...
</pre></td></tr>
<tr><td>CSS 3</td><td>Font Smoothing</td><td>
<pre>
body {
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</pre>
</td></tr>
</table>

