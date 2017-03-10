import { MainComp } from './components/MainComp';
import { TopBarComp } from './components/TopBarComp';
import { CardsComp } from './components/CardsComp';
import { FooterComp } from './components/FooterComp';

document.addEventListener('DOMContentLoaded', init);

function init () {
  window.appMain = riot.mount('comp-main')[0];
  window.appFooter = riot.mount('comp-footer')[0];
}