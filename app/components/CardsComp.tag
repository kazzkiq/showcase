<comp-cards>
  <div class="CardsComp" ref="comp">
    <comp-search ref="search"></comp-search>
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
              { cardLabels.mainButton }
            </div>
            <div class="btn outline" onclick="{ actionDetails }">
              { cardLabels.detailsButton || 'See Details' }
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    this.cards = [];
    this.displayCards = [];
    this.isFilterActive = true;
    this.cardLabels = this.parent.opts.cardLabels[0];

    this.on('mount', () => {
      this.fetchCardsData();
      window.onscroll = this.onscroll;
    });


    /*
     * Object responsible for creating card objects
     * Every object from JSON must pass its values to
     * this object.
     * See fetchCardsData() for details.
     */
    createCardObj () {
      return {
        name: null,
        description: null,
        descriptionFull: null,
        imageUrl: null,
        link: null,
        tags: []
      }
    }


    /*
     * Infinite Scroll function
     * 
     * If you change anything bellow, remember to chance CSS to
     * reflect same height and items per line.
     */
     onscroll(e) {
       console.log(this.isFilterActive);
      if(!this.isFilterActive) {
        return;
      }

      this.cardsCompTop = this.refs.comp.getBoundingClientRect().top;
      var itemheight    = 300 - (300 / 5);  // Height of item (keep 20% smaller for scroll to happen)
      var chunksize     = 4;    // Number of rows to render (each row defaults to 4 items)
      var itemsPerRow   = 4;    // Number of items per chunk row
      var chunk         = Math.floor(window.scrollY / (chunksize * itemheight * 0.95));

      // Hit end of the current chunk, then load more items
      if(chunk > (this.lastchunk || 0)) {
        this.displayCards  = this.cards.slice(0, (chunksize * itemsPerRow) * (chunk + 1));
        this.lastchunk     = chunk;
        this.update();
      } else {
        e.preventUpdate    = true;
      }
    }


    /*
     * Modify your JSON AJAX URL and object here
     */
    fetchCardsData () {
      // URL responsible for cards data
      const API_PATH = this.parent.opts.cardsJsonUrl;

      ajax().get(API_PATH).then((res, xhr) => {
        
        res.forEach((current) => {
          let card = this.createCardObj();

          // This is where you bind your objects fetched from JSON
          card.name = current.name;
          card.description = current.description;
          card.descriptionFull = current.descriptionFull;
          card.imageUrl = current.imageUrl;
          card.link = current.link;
          card.tags = current.tags || [];

          // Push new card object to array of cards
          this.cards.push(card);
        });


        // Show only the first 16 cards (and let Infinite Scroll show others later)
        this.displayCards = this.cards.slice(0, 16);

        // Update component so it reflect the objects changes
        this.update();
      });
    }

    /*
     * Details Action, by default it opens a sidebar with card details
     * You can modify its behavior by editting this function
     */
    actionDetails (e) {
      const currentCard = e.item;
      let comp = document.createElement('COMP-SIDEBAR');

      document.body.append(comp);
      riot.mount(comp, currentCard);
    }
  </script>
</comp-cards>