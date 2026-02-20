'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "356e097a4bff82af3b5bada30d2f55d7",
".git/config": "906ee78f38302bc8fb13f18c1cea72f6",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "ab90b03fa8285723f1076b56b2b20af4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "2ab5cf84932fad0955ad23a8a754cb86",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "83351a4ba4550b421edc3eb016bc6773",
".git/logs/refs/heads/up-to-site": "7ebc4e8438429192704c5f4bdc4986db",
".git/logs/refs/remotes/origin/up-to-site": "6714184d6f712846239501802da08d24",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/0b/e28e57e4e72257ec0ae513358d3bce0cab4b2b": "15783227c6a1e7b9e60666e5498136f0",
".git/objects/0e/3c5f3dfa16028bfe2a6f2aee1b90d448f25b6e": "313f11384dffe444b7c95be04d337da5",
".git/objects/0f/f81975852c5ea348bdbdd6b0b8174ad8b35d39": "73a50c10b49331b961ec22c65a01fce7",
".git/objects/12/7144716e71eabe131d33bf32d48df6be8dda96": "b469924e550b1252019cec6fa6b51fa0",
".git/objects/12/87e581328fa90eaf32c17671a7c7e1db25db4e": "71b5898ebd803d8f7d7d21a51bc56a88",
".git/objects/12/c899ec7aa8017b434eb759c7a1099b3d923914": "a2842a10d2f1c2c4c943596dd0d285b1",
".git/objects/13/19a52a0f6aeda8a07c6c36f1e0f5406c9d1086": "3cfcc7a432ea6026ead8db9e78e88da8",
".git/objects/13/6a7a2e55408024823a17e0108823d350d2f213": "f52a8a3d024f655b2eeb1add4c988ebe",
".git/objects/17/3eab51f70ad25feba302d08fb01f1e1c123e77": "d81dcc3aeb582c4e0810ee0b223473b1",
".git/objects/1e/08e328170f0d2720865dbd15f84a303495a6b4": "cc091deff8e9b16e1af990bc804d8133",
".git/objects/1f/a432f196e2a20475a2195e1057a4ebcb1fb52f": "3d0420c28105c0f1fb6d8c151dd523f4",
".git/objects/21/ddd13ac39e8fccde092d39db7d7b9ee7839b7e": "1c88a94c21551d3a603539b614d0f42c",
".git/objects/24/8fa483fa35723a03a63534df47be65311500cf": "ce25925a6136681c172a20386e4659fd",
".git/objects/2a/9dd8b5db1c7de0a9adc297cb1d7355c43f7a66": "1e53249aa912d20087edcd7f5adad862",
".git/objects/2c/88ac1ba7d397638e2822a39e036303602fc906": "881fe638e716986f11f3040635be675c",
".git/objects/2d/0710bc4dcd9d51781636d161f64fbcd4b558e4": "d2ae527f5d97f4e4b5b3224ba8d22265",
".git/objects/31/2c9e8fbca38e4695e7fb947ce14b9bc753e25d": "8f4d94d31cfcdd10491adfcfcfc999e0",
".git/objects/31/39dc7cf301ea55d8f5e781d98d5c58a6ee1ccd": "e26ff2b827306e1115fe3796b3329bdc",
".git/objects/31/f20db4bd0fb8688d0615863f95a60f894dc319": "545777ca6206b03783ec1d5d084f943f",
".git/objects/36/50634ee2ebd3c6e996094d6990b0ddd3b8bef8": "99be50031b2c98f8d04d0503c35b29e0",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/3d/f2464d069f9f996201b701553e83f719f0ec9b": "44e07dfce49aa5125d044693f52caddb",
".git/objects/40/0c8912faeec3956ffe99462a6a749e14a7a550": "c8c2a40ba590b6f9f20780a921e50752",
".git/objects/45/d8ea9046498a7a7eba28dc982ae04c1a08932e": "7b431c4008c86a6cea9307788de40b9c",
".git/objects/4b/09621868b3022bfa03984073ca03021b99373b": "2a682da72111613e4e106042cbcebf00",
".git/objects/4b/219b03a62676c240af32cb77522b6b191ced1b": "d802f3f63392ff03b330ee1819edca76",
".git/objects/4c/024b2c5cc5e51f8f55f64c8bda97b71f46cae8": "8308d0616e37b793cd925d7e6dddd4f9",
".git/objects/4d/955e35da583028b209bc343285f3c24dc86e12": "4abeef1fff2c9887d3245f999d62f79c",
".git/objects/4e/c1efd6e532a0f5b99e72036e4fad8ac97cecfb": "d70033eefda879c7c6533db968f3feac",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/55/79696041d8919785301643afa2c026ce6f8409": "df746954a5a749034b948d2d965089f6",
".git/objects/5b/12476b103660d46ab46ca6a10a2145e90c7ff9": "9c240b09ff9a349063cd3a8e3949e7fb",
".git/objects/5d/40748dc3e219e368c06d49f3ae2883e13e0ba3": "c968f9f495b72b7c635364f8655ad172",
".git/objects/5d/cbe69697b1b6f1d6ff7bac4d4252d4d9413240": "0abf9b8d2c7aad22e6d0da80532e4d87",
".git/objects/5e/32b54bd3534ae8cf0d96e72744b13c35901f61": "9e667e62c3ad7e93815a5d211d66ccc2",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/60/d9db027cbb29eeaf551ef56b5cfdf53f19d06f": "23d9bf7dd7663e6b68d5ae2bf3cd103e",
".git/objects/62/b7eb5a6264e55898a518fedb1411a15d619ed7": "18e13c23c81e72019e9f65c82a05b6e7",
".git/objects/65/88415fe41c7f6d72f3af7f8c4f99ec112073db": "7a3fc861e8ba365b5f77da79cd5cb7ba",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6b/51a617dbdd8ea3e6a72027a72899b8c4d91e71": "c405dad6f62be6f266c65a164971b4ec",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6c/29807db865e93248aaef4769c184e2ecc4da2a": "26c6770a04b9aba5a20ae13c277b5196",
".git/objects/6f/41554c170a206bbaa9c8b0d8eaa2b12adb035c": "0a088cb235b6fafd1402f5b4a84fc769",
".git/objects/6f/692985c71c469677f8c8c61dbf5b216177279c": "2a3ff47c27c4af3d10c7c481ecc7e28c",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/70/1378c6f33f8acdc7571772601822982f548932": "43f0b1341097883fdaba1edf1e339678",
".git/objects/70/dc4003acdb78601d925da11950f520a237ce08": "790cc6d42b835cd85b6209273b0c9f92",
".git/objects/7b/ad4d04c1ce2bd3f0908f7835d22fcb8ad40036": "c5563f9ca1c47acfe2861b2cd6a3b4ee",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/7c/f2ac601f78a13294fb2081fab955be1a0bc4ba": "afa9e0dc3b4766e1dea0db0b39c4bb49",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/87/b826890f814fb270216c0c3b6dee15e4e83fed": "ceeb946b38fde4f0335e864286487d27",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/21753cdb204192a414b235db41da6a8446c8b4": "1e467e19cabb5d3d38b8fe200c37479e",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/94/2359853fa3fa072584f20417afedb3433a18d4": "31988fcec72017a80e25b4e313547541",
".git/objects/a2/971649915097f127f4d844c6e8f333f079a27c": "b29e51af2f21c3cf338fcc5f8eeea3ec",
".git/objects/a4/4879f7fae4d19a402af9074ccbc637b93c9ff6": "d342937fd2d352b9ac3209ada92f366d",
".git/objects/a5/524b2ea0fc696388351d4cc2e2db1b761be1a1": "4e16cb28ea273742c38ccb9c045e1bac",
".git/objects/a7/3f4b23dde68ce5a05ce4c658ccd690c7f707ec": "ee275830276a88bac752feff80ed6470",
".git/objects/ab/b9040f74c01bc09c9bf02f408ce50cd9956652": "7e96ce6a8dfd3e2cb70a2e1811ad1f2e",
".git/objects/ab/c27f49288bbc85e61b62961a78ff94b5471b9f": "4c1fd1ab5c5eac5b22ac0b4ccd6402a3",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/b3/2b6960ed6da53f4e4044251c2917c1ec244b60": "37cfc7568128914ab375166fdde7d381",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/8b95e38f360f901539194eb2c3a9ea96d9266d": "076921aaed1e57c85c682252a187d3fb",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/b9/f52aabf039e8de9c85960086be851d3462d55a": "e24ba1a48c0616f62f4d188101a0307c",
".git/objects/be/b4858fc3b45a48590766745655b879c7c3892a": "25e7d8e890b9ba9d34b8903a94b027c5",
".git/objects/be/de674649cbe5c2d235d5905db58dd108520501": "5573379ce895b9babc44e8640704ea6c",
".git/objects/bf/2e20830ceec907f28b951f857e4295f3f2ebf0": "49d45321cbdf5a4d5afcae7f59853b70",
".git/objects/bf/ea9cec4d15f4276dd0cf6853f47ec976e1b551": "6d9a45d2f9b6c040c778447df40d3946",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/ce/e3c5bb4ad9ca1b7e02e3391cc1cbba998308b7": "8e23cc0d8eea61c17a30b19ec3ccb417",
".git/objects/cf/9db0dbfd481883100a8ee296be76e23c80a68a": "3383ac611ae60c76d67f06d569286d9b",
".git/objects/d1/13eaa3ceedcb8c7dcaa7f5889af87b941349a1": "809588638a31df0d9de377dc88e58409",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/58e7828c7d2d51ec94d94d85fc9e8f0dc42daa": "176026223bc54111f414b3597b1b7c36",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/db/c031e65e15588d5e6db92f6b4adbdd6e5a780f": "983b8510f963c323a3aa70467aa59e84",
".git/objects/dc/c798d3d416d6cdbc54703b0ca30c6bee094f40": "ef7f6a6cde986853f161669cbb55c0a7",
".git/objects/e3/0ce7a9526c3fe07f011600c0b73f2dc782bd16": "a2681d15131b85ef54e25d23d90828f0",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/ea/59815cfae86a3cbc299dfa5a01277e73466fe4": "dec7db2ddb5826b681e9faf040a44598",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/68ef92244aa3f04545aa650855867a007e95a7": "f8ce003a92df87d596e89cad06f05e6b",
".git/objects/ed/98d277427fde0d72d7572c594dfb0642752b6b": "8851b951f5051cfb55df0469e83cc2b5",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/b9fc31e5a8fc4066a0345c45e5aae7bf154a15": "e885c6ab7d8cdab537090a8984c59a8c",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/f8/e279675293cbb4840bbd7a6c4b51543207b8a3": "88e13f95cb0725c8ee89176e8012b9ec",
".git/objects/fb/528ee96b959a77ef4b15b5dffa654c89b1d292": "94ae9e46c4d9238e234d4a73c98a06a2",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/refs/heads/up-to-site": "7941339bed2e0cad4ffb0fb27abf9c06",
".git/refs/remotes/origin/up-to-site": "7941339bed2e0cad4ffb0fb27abf9c06",
"assets/AssetManifest.bin": "538fc609c4834dd19d8250be67d3a16c",
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
"assets/fonts/MaterialIcons-Regular.otf": "2318895f0ff4ad8daef4236e38f5a394",
"assets/NOTICES": "ad2f5b16e295d57d0f08a60c27192272",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00a0d5a58ed34a52b40eb372392a8b98",
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
"flutter_bootstrap.js": "77cc21c263f9f366ef18440157dd30cd",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fd8ad472d0912355ca0b330f13ce5a7c",
"/": "fd8ad472d0912355ca0b330f13ce5a7c",
"main.dart.js": "cdce0233db3ec3df8e51aca5b642602e",
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
