<comp-cards>
  <div class="CardsComp" ref="comp">
    <div class="search">
      <input type="text">
    </div>
    <div class="container">
      <div class="cards-list">
        <div class="card" each="{ displayCards }">
          <div class="image">
            <img if="{ imageUrl }" src="{ imageUrl }" alt="{ name }">
          </div>
          <div class="title">{ name }</div>
          <div class="description">{ description }</div>
          <hr>
          <div class="action-buttons">
            <div class="btn">
              Visit Project
            </div>
            <div class="btn outline" onclick="{ actionDetails }">
              See Details
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    this.cards = [];
    this.displayCards = [];

    this.on('mount', () => {
      this.fetchCardsData();
      window.onscroll = this.onscroll
    });

    createCardObj () {
      return {
        name: null,
        description: null,
        descriptionFull: null,
        imageUrl: null,
      }
    }

    /*
     * Infinite Scroll function
     */
     onscroll(e) {
      this.cardsCompTop = this.refs.comp.getBoundingClientRect().top;
      var itemheight  = 345  // Height of item
      var chunksize   = 4    // Number of rows to render (each row defaults to 4 items)
      var itemsPerRow = 4
      var chunk       = Math.floor(window.scrollY / (chunksize * itemheight * 0.95));

      console.log(chunksize * (chunk + 1));

      if(chunk > (this.lastchunk || 0)) {
        console.log('end of chunk')
        this.displayCards  = this.cards.slice(0, (chunksize * itemsPerRow) * (chunk + 1))
        this.lastchunk  = chunk
        this.update();
      } else {
        //console.log('no end of chunk')
        e.preventUpdate = true
      }
    }


    /*
     * Modify your JSON AJAX URL and object here
     */
    fetchCardsData () {
      const API_PATH = '/sample.json';
      ajax().get(API_PATH).then((res, xhr) => {
        
        res.forEach((current) => {
          let card = this.createCardObj();

          // This is where you bind your objects fetched from JSON
          card.name = current.name;
          card.description = current.description;
          card.descriptionFull = current.descriptionFull;
          card.imageUrl = current.imageUrl;

          this.cards.push(card);
        });

        this.displayCards = this.cards.slice(0, 16);

        this.update();
      });
    }

    /*
     * Modify your details action here
     */
    actionDetails (e) {
      const item = e.item;
      
      let comp = document.createElement('COMP-SIDEBAR');
      document.body.append(comp);
      riot.mount(comp, item);
    }
  </script>
</comp-cards>