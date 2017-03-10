import { MainComp } from './components/MainComp';
import { TopBarComp } from './components/TopBarComp';
import { CardsComp } from './components/CardsComp';

document.addEventListener('DOMContentLoaded', init);

function init () {
  window.appMain = riot.mount('comp-main')[0];
}