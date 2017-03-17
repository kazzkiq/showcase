<comp-topbar>
 <div class="container">
    <header class="TopBarComp">
      <img class="logo" src="imgs/logo.svg" alt="Showcase">
      <nav class="menu">
        <ul>
          <li each="{ parent.opts.headerLinks }"><a href="{ url }">{ title }</a></li>
        </ul>
      </nav>
    </header>
 </div>
</comp-topbar>