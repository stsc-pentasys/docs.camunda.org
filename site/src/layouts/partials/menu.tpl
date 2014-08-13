<%
function renderLinkClasses(info) {
  var classes = [];
  if (info.active) { classes.push('active'); }
  if (info.aboveActive) { classes.push('above-active'); }
  if (info.belowActive) { classes.push('below-active'); }
  if (info.itemStyle) {
    classes.push(info.itemStyle);
  }
  return classes.length ? ' class="'+ classes.join(' ') +'"' : '';
}

entry.parent = entry.parent || '';
entry.name = entry.name || '';

var links = entry.links && _.size(entry.links) ? entry.links : false;
%>

<a<%= (entry.url ? ' href="'+ entry.url +'"' : '') +
      (entry.description ? ' title="'+ entry.description +'"' : '') +
      (entry.linkStyle ? ' class="'+ entry.linkStyle +'"' : '') %>>
  <%- (entry.title || entry.name) %>
</a>

<% if (links) { %>
<ul class="menu"
    role="menu">
  <% _.each(entry.links, function(link, name) {
    link.name = name;
    link.dropdownMenu = entry.dropdown;
    link.parent = entry.parent +'/'+ entry.name;
    %>
  <li<%= renderLinkClasses(link) %>>
  <%=
  partial('menu', {
    entry: link
  })
  %>
  </li>
  <% }) %>
</ul>
<% } %>
