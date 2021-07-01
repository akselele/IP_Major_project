/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./js/clock.js":
/*!*********************!*\
  !*** ./js/clock.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("var noon = 12; // The week days\n\nvar weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];\n\nfunction formatNumber(number) {\n  return number < 10 ? \"0\" + number : number;\n}\n\nfunction showCurrentTime() {\n  var currentTime = new Date();\n  var day = currentTime.getDay();\n  var hours = currentTime.getHours();\n  var minutes = currentTime.getMinutes();\n  var seconds = currentTime.getSeconds();\n  var period = \"AM\"; //Set days\n\n  day = weekDays[day]; //Set hours\n\n  if (hours >= noon) {\n    period = \"PM\";\n  }\n\n  if (hours > noon) {\n    hours = hours - 12;\n  } //Set minutes\n\n\n  if (minutes < 10) {\n    //this is so that it displays 05 instead of 5\n    minutes = \"0\" + minutes;\n  } //Set seconds\n\n\n  if (seconds < 10) {\n    //this is so that it displays 05 instead of 5\n    seconds = \"0\" + seconds;\n  }\n\n  document.getElementsByClassName(\"large day\")[0].innerHTML = day;\n  document.getElementsByClassName(\"large hours\")[0].innerHTML = hours;\n  document.getElementsByClassName(\"large minutes\")[0].innerHTML = minutes;\n  document.getElementsByClassName(\"large seconds\")[0].innerHTML = seconds;\n  document.getElementsByClassName(\"large period\")[0].innerHTML = period; // let clocktime = hours + minutes + seconds + period;\n  // clock.innerText = clocktime;\n}\n\nwindow.onload = function () {\n  setInterval(showCurrentTime, 1000);\n}; //window.onload = function () { setTimeout(\"alert('test')\",1000); }\n\n//# sourceURL=webpack:///./js/clock.js?");

/***/ }),

/***/ 0:
/*!***************************!*\
  !*** multi ./js/clock.js ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__(/*! ./js/clock.js */\"./js/clock.js\");\n\n\n//# sourceURL=webpack:///multi_./js/clock.js?");

/***/ })

/******/ });