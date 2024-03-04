'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"main.dart.js": "db0d6bfac45b24c10bc34e468320d4fe",
"version.json": "af94a78520287cd3557fa87da6ab96d8",
"assets/assets/icon-light.png": "6a81b563723b5cf1040d9c72e5677b80",
"assets/assets/icon.svg": "98990948ef950a08e5c013acf5dcb6aa",
"assets/assets/svgtopng.zip": "1776ad0f74f5d940a77f37b5648bd676",
"assets/assets/aafi_icon.png": "139698cbaa8714b404e7918ee93109eb",
"assets/assets/aafi_icon_dark.png": "139698cbaa8714b404e7918ee93109eb",
"assets/assets/aafi_icon_light.png": "1c59e9d846367663898493daebc47e42",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.28.jpeg": "430290daf5b9179255a27247965184e1",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.29%2520(1).jpeg": "108049a9d9589cbb216c419b05303d57",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.29%2520(2).jpeg": "05377bb18a11e08be722d3e403f2261a",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.29%2520(3).jpeg": "245f96410d9c8790b88a70be191f3295",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.29.jpeg": "f81518309b37d8b3ace57a9555eb9c84",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.29%2520(4).jpeg": "2ba977abdb00cc17a7ff57451059ac4f",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.29%2520(5).jpeg": "1865cf22a18b37016a640420512f0831",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.30.jpeg": "1d4f3940c8db4ae5d498b7afc3773316",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.30%2520(1).jpeg": "005d77347be831b82212e5d88fd40ce4",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.30%2520(2).jpeg": "e05fe29d57fff53539dfd32db18bee17",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.30%2520(3).jpeg": "108049a9d9589cbb216c419b05303d57",
"assets/assets/galery/WhatsApp%2520Image%25202024-03-02%2520at%252021.29.30%2520(4).jpeg": "320a92094c4fd8636b25369bbec91373",
"assets/assets/galery/miztlisat_2023.png": "690eefbafcd61d741f937b4316a510d0",
"assets/assets/galery/about_us.jpg": "f0dade24a4a3e8d65077738776f7eb7e",
"assets/assets/person_test.jpg": "010b6f3f915c7e210c429bb5e2e7890a",
"assets/assets/rocket.gif": "1cf1f025aa5f172ef5568f588573e489",
"assets/assets/icon.png": "dde0417e83edf84fa42f2d74e8fc6ca9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "b3cfd6832181cbaa3c98988c49d34641",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "0827ac024d627f5c9e1a57194f348022",
"assets/AssetManifest.bin.json": "6e49b3fd9f86a77088c3d72443ec92a8",
"assets/AssetManifest.bin": "471f2757ddd978769c4e5b724fd383da",
"assets/NOTICES": "4007766c8898e11d61afa7cff7d73e81",
"assets/FontManifest.json": "760cc3770462a4d4092771fcdf1361d4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "bd8ab38667ce4d06ed45aea7bcd28cd3",
"index.html": "8a8336b70f72ede697e0b9b90cb100f1",
"/": "8a8336b70f72ede697e0b9b90cb100f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"app.py": "e52fe7e236ecb6e3ca21614c0c3b83a1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
