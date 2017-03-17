<comp-footer>
  <div class="container">
    <div class="FooterComp">
      <div class="logo">
        <img src="imgs/logo.svg" alt="Showcase">
      </div>
      <nav class="menu">
        <ul>
          <li each="{ link in opts }"><a href="{ link.url }">{ link.title }</a></li>
        </ul>
      </nav>
    </div>
  </div>
</comp-footer>