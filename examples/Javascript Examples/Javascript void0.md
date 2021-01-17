Using void(0) is an alternative to setting `href="#"` which scrolls the page.

When using

    <a href="javascript:void(0)">Link</a>

you get a link that does nothing. It doesn't scroll anywhere nor does
it change the location bar in any way. This is useful to add an onclick
handler that does the real work:

    <a href="javascript:void(0)" onclick="someAction(this)">Link</a>
