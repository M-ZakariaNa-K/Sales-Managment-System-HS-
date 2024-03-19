'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "c227bc4fcacb8c6a6875e115fbba90c4",
"assets/AssetManifest.bin.json": "8ab6bcdb4aed4d05edd461448ebbc0f3",
"assets/AssetManifest.json": "de18c747eb6051a6d9771d0056388cda",
"assets/assets/images/administrator.png": "4e25789a1506a4e38edfc91b3f8f1fe3",
"assets/assets/images/excel.png": "60e116a1def318dbedbe402ca25428fa",
"assets/assets/images/industries.png": "b1e00cd953ad4db55fdf65e5fe0947cb",
"assets/assets/images/Logo2.png": "840175281cd7155912d5cd1382028da1",
"assets/assets/images/pdf.png": "847c6dade877e0be3c2dffafb6f99793",
"assets/assets/images/pic1.jpg": "3cb58f05f2e66abd84005435b904d617",
"assets/assets/images/pic2.jpg": "72e5eccfb013c8debfb98ce33cc38c6c",
"assets/assets/images/pic3.jpg": "2738386668bf2c8e5ae801b0389e2967",
"assets/assets/images/Profile.png": "0b3cdc14c6cdb52b97eee2e9c6446695",
"assets/assets/images/search.png": "9c2ee326aed73e4fd021712b41073741",
"assets/assets/images/settings.png": "a5e4791f2705519b4d6835f2f682c43e",
"assets/assets/images/Slideimage1.jpg": "03b99202dd16c6ece33eb59df01a2eb1",
"assets/assets/images/Slideimage2.jpg": "4e65b95d9006ff35e50ad193f4f65009",
"assets/assets/images/Slideimage3.jpg": "f9ffbd65b0800f04ca896f2ac5884b7d",
"assets/assets/images/u.jpg": "9abbd92477229d345792fadbe0b9e329",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "84d810ef176af3c3d6b3d6cd259568bb",
"assets/images/administrator.png": "4e25789a1506a4e38edfc91b3f8f1fe3",
"assets/images/excel.png": "60e116a1def318dbedbe402ca25428fa",
"assets/images/industries.png": "b1e00cd953ad4db55fdf65e5fe0947cb",
"assets/images/Logo2.png": "840175281cd7155912d5cd1382028da1",
"assets/images/pdf.png": "847c6dade877e0be3c2dffafb6f99793",
"assets/images/pic1.jpg": "3cb58f05f2e66abd84005435b904d617",
"assets/images/pic2.jpg": "72e5eccfb013c8debfb98ce33cc38c6c",
"assets/images/pic3.jpg": "2738386668bf2c8e5ae801b0389e2967",
"assets/images/Profile.png": "0b3cdc14c6cdb52b97eee2e9c6446695",
"assets/images/search.png": "9c2ee326aed73e4fd021712b41073741",
"assets/images/settings.png": "a5e4791f2705519b4d6835f2f682c43e",
"assets/images/Slideimage1.jpg": "03b99202dd16c6ece33eb59df01a2eb1",
"assets/images/Slideimage2.jpg": "4e65b95d9006ff35e50ad193f4f65009",
"assets/images/Slideimage3.jpg": "f9ffbd65b0800f04ca896f2ac5884b7d",
"assets/images/u.jpg": "9abbd92477229d345792fadbe0b9e329",
"assets/NOTICES": "4891578215d48b4cd323fdce006a02e9",
"assets/packages/fluttertoast/assets/toastify.css": "910ddaaf9712a0b0392cf7975a3b7fb5",
"assets/packages/fluttertoast/assets/toastify.js": "18cfdd77033aa55d215e8a78c090ba89",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "78cb5ac2373309dd624f9072c9023f66",
"/": "78cb5ac2373309dd624f9072c9023f66",
"logo.png": "840175281cd7155912d5cd1382028da1",
"main.dart.js": "454de257bc9687d2fdec9697dc2c4bda",
"manifest.json": "2e8585c3db109099490ab70d32dad4cf",
"version.json": "32766bb5c5a6a251bbcb6665a18f31d8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
