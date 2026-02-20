'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "538fc609c4834dd19d8250be67d3a16c",
"assets/AssetManifest.bin.json": "2016bb8f15ef4a6666b7e0e7d3902727",
"assets/assets/fonts/MaterialIcons-Regular.otf": "d5d9a63ed433e0cefd1a4dc606ae6334",
"assets/assets/icons/skills/arduino.png": "a851784368f823d2749f6944d515400b",
"assets/assets/icons/skills/balsamiq.png": "4dd648661ea662f28d6fe2ab2f63b829",
"assets/assets/icons/skills/canva.png": "bf0a5c2b33d5f590554164a6749cec89",
"assets/assets/icons/skills/capcut.png": "ac0b800ef8f1885b27094e97faab5efd",
"assets/assets/icons/skills/coreldraw.png": "1224bcbef33bdf5c2bbbba156a0919b3",
"assets/assets/icons/skills/coreldraw.webp": "df2a00d969fb321aff02db757d407f9f",
"assets/assets/icons/skills/css.png": "6d2ff665987bd657785e26c1372fc4b3",
"assets/assets/icons/skills/dart.png": "c5699907e7e4d4605156a21b4f9a21b6",
"assets/assets/icons/skills/drawio.png": "aaba08172329f1cab427777f17f2e3f7",
"assets/assets/icons/skills/excel.png": "8c947258c2fc72354d65c0ab06f82c7b",
"assets/assets/icons/skills/figma.png": "251d63913080c3113f43f0ea60de3712",
"assets/assets/icons/skills/flutter.png": "b2d1775e8dc6a17ad879d145cc3b3b81",
"assets/assets/icons/skills/git.png": "757bb623ef726b18cdd0080583e8eb74",
"assets/assets/icons/skills/github.png": "9cfca40bdd06e38248f8061dc27b3d3b",
"assets/assets/icons/skills/html.png": "d64fa88d37a16be8c34c93e51897341a",
"assets/assets/icons/skills/illustrator.png": "7269b89183bb6a722565e23585972ff8",
"assets/assets/icons/skills/java.png": "7029b83f78d9705914a869332f4589c9",
"assets/assets/icons/skills/javascript.png": "929ae424ebd8694d77d3d4a164d829a8",
"assets/assets/icons/skills/mysql.png": "69bf8df10d3c037fd06a1280e1025ef2",
"assets/assets/icons/skills/netbeans.png": "d27b4fd630bdf2a31a34e26147e355b4",
"assets/assets/icons/skills/photoshop.png": "c96c1a4c9b3cb0245a9a818595e7f629",
"assets/assets/icons/skills/php.png": "86745c4927be29e66ed00eb9a1ea4db4",
"assets/assets/icons/skills/phpmyadmin.png": "ceb2d7e24779bd9c026cfd5438daf396",
"assets/assets/icons/skills/tailwind.png": "58536fff725006df750eb07e8af5511d",
"assets/assets/icons/skills/visio.png": "3db7576fb45fa649651596a4d72372fe",
"assets/assets/icons/skills/vscode.png": "d100d04d82f8e5d7848a15adb9f56c24",
"assets/assets/icons/skills/word.png": "d8d893a304049fad2a6daf28aeded730",
"assets/assets/images/experience/companygc.png": "882abc6eb4038269a6ab5874789c8cf0",
"assets/assets/images/experience/companyibs.png": "abb6c98bf9609221bf53d1ae6f6a4853",
"assets/assets/images/home/profile.png": "cc188b4dde550f876228cc5d6ffab7d4",
"assets/assets/images/image_preview.png": "ac7219a6278aeac599b63c2b4409dd51",
"assets/assets/images/project/aes.png": "da07f832779a456bc6affd1ab49c3376",
"assets/assets/images/project/amalbaik.png": "474287f65aae381bac21a1be8292f2cf",
"assets/assets/images/project/khodam.png": "39d7182db6e60bd90c9551cfa58e4c8d",
"assets/assets/images/project/lks.png": "04010481f8d39f8ca702c0ee0a84bcae",
"assets/assets/images/project/techlogo.png": "7d27d7d8f865cccae38bac00cd3d9010",
"assets/assets/images/wtsp.png": "ea28f2da75d2c019496d2706d04b8124",
"assets/FontManifest.json": "67a28da3784fc091c2f816d615fbf08a",
"assets/fonts/MaterialIcons-Regular.otf": "d5d9a63ed433e0cefd1a4dc606ae6334",
"assets/NOTICES": "ad2f5b16e295d57d0f08a60c27192272",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"file/download/CyrptoFileAES.exe": "2c2d2b1a280deb980c68f1f226215ac5",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "d5137c32ff8d1133839c9470715c299e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "5f25612ee13f695e2c960abc43069c20",
"/": "5f25612ee13f695e2c960abc43069c20",
"main.dart.js": "d6b5aa24a9f1967980023af4938a747a",
"manifest.json": "e661dfa47ccad5f95d74e0278187af48",
"version.json": "78d8bef27a1a2cb2dcbac12acafafa7e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
