import "bootstrap";
import { datepicker } from "./datepicker";

import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from './init_mapbox';

initMapbox();

datepicker();
