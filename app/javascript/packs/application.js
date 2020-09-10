require("@rails/ujs").start()
require("turbolinks").start()
require("channels")

import 'select2/dist/css/select2.css';
import { multipleSelect } from '../components/select';

document.addEventListener('turbolinks:load', () => {
  multipleSelect();
});
