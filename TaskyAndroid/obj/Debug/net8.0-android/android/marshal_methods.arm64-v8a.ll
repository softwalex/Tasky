; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [408 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [810 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 234
	i64 44359872337921045, ; 1: System.ServiceModel.NetTcp => 0x9d9911a0fbc415 => 201
	i64 59393587543438216, ; 2: tr/System.ServiceModel.NetNamedPipe.resources.dll => 0xd3022737767388 => 372
	i64 98382396393917666, ; 3: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 183
	i64 120698629574877762, ; 4: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 5: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 193
	i64 162552888780219690, ; 6: ja/System.ServiceModel.NetNamedPipe.resources.dll => 0x24180fdb8f5652a => 367
	i64 176210343261064415, ; 7: System.ServiceModel.NetNamedPipe.dll => 0x272065fa3d34cdf => 200
	i64 189862278688067135, ; 8: es/System.ServiceModel.Primitives.resources.dll => 0x2a286bc8d72ce3f => 390
	i64 196720943101637631, ; 9: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 10: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 221
	i64 229794953483747371, ; 11: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 12: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 262
	i64 233856603507324090, ; 13: System.ServiceModel.Federation.dll => 0x33ed357846ef4ba => 197
	i64 295915112840604065, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 265
	i64 316157742385208084, ; 15: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 228
	i64 329079579674636315, ; 16: pl\System.ServiceModel.Federation.resources => 0x49120225957701b => 330
	i64 350667413455104241, ; 17: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 368310478436231069, ; 18: tr\System.ServiceModel.NetFramingBase.resources => 0x51c806dc23ee79d => 359
	i64 387140843282343205, ; 19: ko/System.ServiceModel.Federation.resources.dll => 0x55f668bb9e3a525 => 329
	i64 396868157601372792, ; 20: Microsoft.VisualStudio.DesignTools.TapContract => 0x581f57c947e5a78 => 403
	i64 413889318740378791, ; 21: ja/System.ServiceModel.NetFramingBase.resources.dll => 0x5be6e247bd944a7 => 354
	i64 422779754995088667, ; 22: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 23: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 264
	i64 439161221770931646, ; 24: System.ServiceModel.Security => 0x61836cdeec86dbe => 204
	i64 519948357370865659, ; 25: ru/System.ServiceModel.Primitives.resources.dll => 0x7373a46b6a367fb => 397
	i64 535107122908063503, ; 26: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 181
	i64 545109961164950392, ; 27: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 296
	i64 560278790331054453, ; 28: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 571911706346497508, ; 29: zh-Hant\System.ServiceModel.Primitives.resources => 0x7efd6aab3aba5e4 => 400
	i64 634308326490598313, ; 30: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 247
	i64 649145001856603771, ; 31: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 671463996660361984, ; 32: TaskyAndroid => 0x95184f28867ab00 => 0
	i64 703889276121812442, ; 33: System.ServiceModel.Duplex.dll => 0x9c4b79138728dda => 202
	i64 750875890346172408, ; 34: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 35: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 222
	i64 799765834175365804, ; 36: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 37: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 299
	i64 872800313462103108, ; 38: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 233
	i64 895210737996778430, ; 39: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 248
	i64 940822596282819491, ; 40: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 41: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 42: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1049216803855315730, ; 43: zh-Hant/System.ServiceModel.Federation.resources.dll => 0xe8f911fc62ab312 => 335
	i64 1106195547578177592, ; 44: ja\System.ServiceModel.NetNamedPipe.resources => 0xf59fefd59841838 => 367
	i64 1120440138749646132, ; 45: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 277
	i64 1121665720830085036, ; 46: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 307
	i64 1166987153734377595, ; 47: ru/System.ServiceModel.NetTcp.resources.dll => 0x1031f8a223c8207b => 384
	i64 1268860745194512059, ; 48: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301626418029409250, ; 49: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 50: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 217
	i64 1320654197929453943, ; 51: Microsoft.IdentityModel.Tokens.Saml => 0x1253e7fef2b6a977 => 187
	i64 1350488117176064860, ; 52: ja\System.ServiceModel.NetTcp.resources => 0x12bde5c991aa5b5c => 380
	i64 1369545283391376210, ; 53: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 255
	i64 1404195534211153682, ; 54: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 55: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1426556759400165484, ; 56: zh-Hans/System.ServiceModel.Http.resources.dll => 0x13cc25d07ffab06c => 347
	i64 1476839205573959279, ; 57: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 58: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 190
	i64 1492954217099365037, ; 59: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 60: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1537168428375924959, ; 61: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 62: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 305
	i64 1576750169145655260, ; 63: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 276
	i64 1617235198659916586, ; 64: ko\System.ServiceModel.Primitives.resources => 0x167192d83e61f32a => 394
	i64 1624659445732251991, ; 65: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 216
	i64 1628611045998245443, ; 66: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 251
	i64 1636321030536304333, ; 67: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 241
	i64 1651782184287836205, ; 68: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 69: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1680559570755486426, ; 70: tr\System.ServiceModel.Http.resources => 0x17528c068ec382da => 346
	i64 1682513316613008342, ; 71: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1735388228521408345, ; 72: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 73: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1764797081625604034, ; 74: fr\System.ServiceModel.Federation.resources => 0x187dd1986ef0afc2 => 326
	i64 1767386781656293639, ; 75: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 76: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 215
	i64 1813473727062752547, ; 77: zh-Hant\System.ServiceModel.NetNamedPipe.resources => 0x192ac0bf1f143d23 => 374
	i64 1825687700144851180, ; 78: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 79: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 295
	i64 1836611346387731153, ; 80: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 262
	i64 1840441330330567270, ; 81: zh-Hant/System.ServiceModel.Primitives.resources.dll => 0x198a8fa38c4d0266 => 400
	i64 1854145951182283680, ; 82: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 83: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 84: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 212
	i64 1881198190668717030, ; 85: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 317
	i64 1897575647115118287, ; 86: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 264
	i64 1920760634179481754, ; 87: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 191
	i64 1959996714666907089, ; 88: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 317
	i64 1972385128188460614, ; 89: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1980725144359361681, ; 90: ru\System.ServiceModel.Federation.resources => 0x1b7cf30643395c91 => 332
	i64 1981742497975770890, ; 91: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 249
	i64 1983698669889758782, ; 92: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 291
	i64 2019660174692588140, ; 93: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 309
	i64 2040001226662520565, ; 94: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2059469483644638515, ; 95: ru\System.ServiceModel.NetTcp.resources => 0x1c94b49576655533 => 384
	i64 2062890601515140263, ; 96: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 97: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 285
	i64 2080945842184875448, ; 98: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 99: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 100: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2165310824878145998, ; 101: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 209
	i64 2165725771938924357, ; 102: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 219
	i64 2179947168683658163, ; 103: de\System.ServiceModel.NetNamedPipe.resources => 0x1e40ba666a820bb3 => 363
	i64 2187820665329845162, ; 104: it\System.ServiceModel.NetTcp.resources => 0x1e5cb34db53e83aa => 379
	i64 2200176636225660136, ; 105: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 180
	i64 2262844636196693701, ; 106: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 233
	i64 2284054589560053283, ; 107: ru\System.ServiceModel.Primitives.resources => 0x1fb2978c3a53de23 => 397
	i64 2287834202362508563, ; 108: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 109: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 110: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 313
	i64 2304837677853103545, ; 111: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 261
	i64 2309964453332250390, ; 112: de\System.ServiceModel.NetFramingBase.resources => 0x200ea46e7ca5ef16 => 350
	i64 2315304989185124968, ; 113: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 114: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 244
	i64 2334065076924874282, ; 115: pl\System.ServiceModel.Http.resources => 0x206443d230c07e2a => 343
	i64 2335503487726329082, ; 116: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 117: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2470498323731680442, ; 118: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 226
	i64 2479423007379663237, ; 119: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 271
	i64 2497223385847772520, ; 120: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 121: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 210
	i64 2592350477072141967, ; 122: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 123: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 316
	i64 2612152650457191105, ; 124: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 186
	i64 2624866290265602282, ; 125: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 126: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 127: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 176
	i64 2662981627730767622, ; 128: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 291
	i64 2700519926408562886, ; 129: zh-Hant/System.ServiceModel.NetNamedPipe.resources.dll => 0x257a2c90aa7248c6 => 374
	i64 2706075432581334785, ; 130: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2760160909669527043, ; 131: ja/System.ServiceModel.NetTcp.resources.dll => 0x264e0fb92fc56e03 => 380
	i64 2783046991838674048, ; 132: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 133: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 266
	i64 2815524396660695947, ; 134: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2895129759130297543, ; 135: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 296
	i64 2923871038697555247, ; 136: Jsr305Binding => 0x2893ad37e69ec52f => 278
	i64 3017136373564924869, ; 137: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 138: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 277
	i64 3062772059105072826, ; 139: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0x2a8126f5e2f316ba => 402
	i64 3075974917408215435, ; 140: zh-Hant\System.ServiceModel.Http.resources => 0x2ab00ee3e220d18b => 348
	i64 3106100055920985814, ; 141: it/System.ServiceModel.NetFramingBase.resources.dll => 0x2b1b158b45fdc6d6 => 353
	i64 3106852385031680087, ; 142: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 143: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 144: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3227901148727174408, ; 145: pl/System.ServiceModel.Primitives.resources.dll => 0x2ccbcefe1bf56508 => 395
	i64 3281594302220646930, ; 146: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3283174272583324799, ; 147: de/System.ServiceModel.NetNamedPipe.resources.dll => 0x2d902d9b1d07d47f => 363
	i64 3289520064315143713, ; 148: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 242
	i64 3303437397778967116, ; 149: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 213
	i64 3311221304742556517, ; 150: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 151: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328758490895923850, ; 152: ja\System.ServiceModel.Federation.resources => 0x2e32203600eaba8a => 328
	i64 3328853167529574890, ; 153: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 154: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 288
	i64 3429672777697402584, ; 155: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 193
	i64 3437845325506641314, ; 156: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 157: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 268
	i64 3494946837667399002, ; 158: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 174
	i64 3508450208084372758, ; 159: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 160: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 267
	i64 3531994851595924923, ; 161: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 162: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3552918255982455594, ; 163: ko\System.ServiceModel.NetTcp.resources => 0x314e805463d5ab2a => 381
	i64 3561390990477819316, ; 164: pl\System.ServiceModel.NetFramingBase.resources => 0x316c9a3c9db4fdb4 => 356
	i64 3567343442040498961, ; 165: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 311
	i64 3571415421602489686, ; 166: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3634544395678783861, ; 167: System.ServiceModel => 0x32707edf08d21975 => 205
	i64 3638003163729360188, ; 168: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 175
	i64 3647754201059316852, ; 169: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 170: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 174
	i64 3656732466067224761, ; 171: Microsoft.IdentityModel.Protocols.WsTrust => 0x32bf52cdbe9338b9 => 185
	i64 3659371656528649588, ; 172: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 207
	i64 3661347406458881470, ; 173: pl/System.ServiceModel.Federation.resources.dll => 0x32cfb811494785be => 330
	i64 3716579019761409177, ; 174: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3724788330609220757, ; 175: it\System.ServiceModel.NetNamedPipe.resources => 0x33b11b407d7b9c95 => 366
	i64 3727469159507183293, ; 176: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 260
	i64 3772598417116884899, ; 177: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 234
	i64 3847323185292082162, ; 178: fr\System.ServiceModel.Http.resources => 0x3564700d93757bf2 => 339
	i64 3869221888984012293, ; 179: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 178
	i64 3869649043256705283, ; 180: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3890352374528606784, ; 181: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 191
	i64 3919223565570527920, ; 182: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 183: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3937697360741473042, ; 184: zh-Hans/System.ServiceModel.Federation.resources.dll => 0x36a582e303fd1b12 => 334
	i64 3966267475168208030, ; 185: System.Memory => 0x370b03412596249e => 62
	i64 4006972109285359177, ; 186: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 187: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 188: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 189: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 189
	i64 4119158804516806643, ; 190: ko/System.ServiceModel.Http.resources.dll => 0x392a311bc4a59ff3 => 342
	i64 4120493066591692148, ; 191: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 322
	i64 4148881117810174540, ; 192: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 193: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 194: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 195: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 196: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 197: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 228
	i64 4205801962323029395, ; 198: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4206559769820211150, ; 199: fr/System.ServiceModel.Primitives.resources.dll => 0x3a60b3d2c69527ce => 391
	i64 4234650624138384307, ; 200: tr\System.ServiceModel.Federation.resources => 0x3ac4804e77a793b3 => 333
	i64 4235503420553921860, ; 201: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4282138915307457788, ; 202: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4321177614414309855, ; 203: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x3bf7e8254e88e9df => 402
	i64 4334223412680886043, ; 204: ru/System.ServiceModel.Http.resources.dll => 0x3c26413aea06871b => 345
	i64 4351295671783217625, ; 205: cs\System.ServiceModel.Http.resources => 0x3c62e85bfd5559d9 => 336
	i64 4356591372459378815, ; 206: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 319
	i64 4359441015448386636, ; 207: it/System.ServiceModel.NetNamedPipe.resources.dll => 0x3c7fd8819911bc4c => 366
	i64 4373617458794931033, ; 208: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4388777479429739993, ; 209: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x3ce811dd63a4d5d9 => 401
	i64 4397634830160618470, ; 210: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4428882291034034432, ; 211: ja/System.ServiceModel.Primitives.resources.dll => 0x3d768cfa7d1a1100 => 393
	i64 4463560197053177287, ; 212: pl/System.ServiceModel.NetTcp.resources.dll => 0x3df1c059aaed5dc7 => 382
	i64 4477672992252076438, ; 213: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 214: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 215: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4560453051006720631, ; 216: it\System.ServiceModel.NetFramingBase.resources => 0x3f49fbe3381a1a77 => 353
	i64 4616101634287018717, ; 217: pt-BR\System.ServiceModel.Primitives.resources => 0x400faffaaec722dd => 396
	i64 4636684751163556186, ; 218: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 272
	i64 4672453897036726049, ; 219: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 220: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 289
	i64 4716677666592453464, ; 221: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 222: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 223: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 246
	i64 4794310189461587505, ; 224: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 210
	i64 4795410492532947900, ; 225: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 267
	i64 4809057822547766521, ; 226: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 227: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 228: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 229: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 211
	i64 5071398478759053283, ; 230: ja\System.ServiceModel.Primitives.resources => 0x46613a0c08e3c7e3 => 393
	i64 5081566143765835342, ; 231: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5096255990897624623, ; 232: it/System.ServiceModel.Federation.resources.dll => 0x46b989d295e8c62f => 327
	i64 5099468265966638712, ; 233: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 234: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5178715688604046882, ; 235: ru\System.ServiceModel.Http.resources => 0x47de7e7b13fc9622 => 345
	i64 5182934613077526976, ; 236: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 237: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 253
	i64 5244375036463807528, ; 238: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 239: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 240: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 241: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 245
	i64 5290786973231294105, ; 242: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5300219786275769134, ; 243: fr/System.ServiceModel.NetTcp.resources.dll => 0x498e29d05876cb2e => 378
	i64 5375923372247632090, ; 244: ko/System.ServiceModel.NetFramingBase.resources.dll => 0x4a9b1dd2fe8a48da => 355
	i64 5376510917114486089, ; 245: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 271
	i64 5408338804355907810, ; 246: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 269
	i64 5423376490970181369, ; 247: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 248: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5445845718793242646, ; 249: de\System.ServiceModel.Primitives.resources => 0x4b9387d3f240c816 => 389
	i64 5446034149219586269, ; 250: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 251: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 224
	i64 5457765010617926378, ; 252: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 253: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 315
	i64 5507995362134886206, ; 254: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 255: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 318
	i64 5527431512186326818, ; 256: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 257: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 258: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 259: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 214
	i64 5591791169662171124, ; 260: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5650097808083101034, ; 261: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5650370239627215726, ; 262: System.ServiceModel.Security.dll => 0x4e6a25cbc66b436e => 204
	i64 5692067934154308417, ; 263: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 274
	i64 5724799082821825042, ; 264: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 237
	i64 5757522595884336624, ; 265: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 223
	i64 5783556987928984683, ; 266: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5816864004925684276, ; 267: fr\System.ServiceModel.Primitives.resources => 0x50b9a6fe5059fa34 => 391
	i64 5860375757134996729, ; 268: ru/System.ServiceModel.NetNamedPipe.resources.dll => 0x51543cb39657a4f9 => 371
	i64 5867185805380132584, ; 269: ko/System.ServiceModel.Primitives.resources.dll => 0x516c6e6780e59ee8 => 394
	i64 5896680224035167651, ; 270: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 243
	i64 5938631692456801490, ; 271: tr\System.ServiceModel.NetTcp.resources => 0x526a420f60c3b4d2 => 385
	i64 5952455131197516416, ; 272: cs\System.ServiceModel.Federation.resources => 0x529b5e67847aaa80 => 323
	i64 5959344983920014087, ; 273: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 263
	i64 5975693538080295492, ; 274: pt-BR\System.ServiceModel.NetTcp.resources => 0x52eded9cbfdf8a44 => 383
	i64 5979151488806146654, ; 275: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 276: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 277: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 312
	i64 6102788177522843259, ; 278: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 263
	i64 6184291411622536774, ; 279: fr\System.ServiceModel.NetTcp.resources => 0x55d30445e942a646 => 378
	i64 6200764641006662125, ; 280: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 312
	i64 6222399776351216807, ; 281: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 282: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 283: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 284: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6288213823986309268, ; 285: ko\System.ServiceModel.NetFramingBase.resources => 0x5744392812679894 => 355
	i64 6319713645133255417, ; 286: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 247
	i64 6357457916754632952, ; 287: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 404
	i64 6367018942829578670, ; 288: ja/System.ServiceModel.Federation.resources.dll => 0x585c31fe9d8a49ae => 328
	i64 6401687960814735282, ; 289: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 244
	i64 6457407416161890188, ; 290: es/System.ServiceModel.Federation.resources.dll => 0x599d51d50a4d6f8c => 325
	i64 6478287442656530074, ; 291: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 300
	i64 6504860066809920875, ; 292: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 219
	i64 6506916921333231814, ; 293: ko\System.ServiceModel.Http.resources => 0x5a4d3676ff0bb0c6 => 342
	i64 6548213210057960872, ; 294: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 230
	i64 6557084851308642443, ; 295: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 275
	i64 6560151584539558821, ; 296: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 182
	i64 6589202984700901502, ; 297: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 280
	i64 6591971792923354531, ; 298: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 245
	i64 6617685658146568858, ; 299: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6703725107163354527, ; 300: tr\System.ServiceModel.NetNamedPipe.resources => 0x5d086a779456d59f => 372
	i64 6713440830605852118, ; 301: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 302: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 303: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 308
	i64 6750700927172492327, ; 304: it\System.ServiceModel.Http.resources => 0x5daf4eb9fd043c27 => 340
	i64 6772837112740759457, ; 305: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 306: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 311
	i64 6786606130239981554, ; 307: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 308: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 309: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6869993514317880518, ; 310: de/System.ServiceModel.Federation.resources.dll => 0x5f571eb3d6279cc6 => 324
	i64 6876862101832370452, ; 311: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 312: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6994714925497792253, ; 313: cs\System.ServiceModel.NetTcp.resources => 0x6112382a476b36fd => 375
	i64 7011053663211085209, ; 314: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 239
	i64 7041056731259377614, ; 315: pt-BR\System.ServiceModel.Federation.resources => 0x61b6dbcabe1697ce => 331
	i64 7060448593242414269, ; 316: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 196
	i64 7060896174307865760, ; 317: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 318: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7098780445870241465, ; 319: pt-BR/System.ServiceModel.NetNamedPipe.resources.dll => 0x6283ef345e95b6b9 => 370
	i64 7101497697220435230, ; 320: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 321: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 240
	i64 7105430439328552570, ; 322: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 195
	i64 7112547816752919026, ; 323: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7192745174564810625, ; 324: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 209
	i64 7200517792190262741, ; 325: zh-Hant/System.ServiceModel.NetFramingBase.resources.dll => 0x63ed60c832616dd5 => 361
	i64 7220009545223068405, ; 326: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 315
	i64 7270811800166795866, ; 327: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 328: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 329: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 330: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7343975498128436721, ; 331: cs/System.ServiceModel.NetTcp.resources.dll => 0x65eb0ace351e2df1 => 375
	i64 7349431895026339542, ; 332: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 208
	i64 7350910574546538092, ; 333: ru\System.ServiceModel.NetNamedPipe.resources => 0x6603ae3883824e6c => 371
	i64 7377312882064240630, ; 334: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7411086746255647294, ; 335: zh-Hans/System.ServiceModel.NetFramingBase.resources.dll => 0x66d978214e2c623e => 360
	i64 7462724204265000896, ; 336: de/System.ServiceModel.Primitives.resources.dll => 0x6790ec1fe3eccfc0 => 389
	i64 7488575175965059935, ; 337: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 338: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7503526963013706253, ; 339: System.ServiceModel.dll => 0x6821e20478ff620d => 205
	i64 7507338075031127501, ; 340: pl\System.ServiceModel.NetNamedPipe.resources => 0x682f6c3422fec5cd => 369
	i64 7592577537120840276, ; 341: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 342: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 343: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 344: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 345: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 306
	i64 7714652370974252055, ; 346: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 347: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 248
	i64 7735176074855944702, ; 348: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 349: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 283
	i64 7791074099216502080, ; 350: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 351: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 352: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 216
	i64 8025517457475554965, ; 353: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 354: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8046612836032419316, ; 355: ru/System.ServiceModel.NetFramingBase.resources.dll => 0x6fab4fbdd8cf95f4 => 358
	i64 8064050204834738623, ; 356: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 357: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 242
	i64 8085230611270010360, ; 358: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 359: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 360: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 361: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8161788945634753591, ; 362: pt-BR\System.ServiceModel.NetNamedPipe.resources => 0x71447fcd9444fc37 => 370
	i64 8167236081217502503, ; 363: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8174477988419522883, ; 364: zh-Hans\System.ServiceModel.Http.resources => 0x7171946b93fed143 => 347
	i64 8185542183669246576, ; 365: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187568296582843689, ; 366: ru\System.ServiceModel.NetFramingBase.resources => 0x71a015fc74120d29 => 358
	i64 8187640529827139739, ; 367: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 287
	i64 8246048515196606205, ; 368: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 194
	i64 8248431922176115102, ; 369: ru/System.ServiceModel.Federation.resources.dll => 0x72785121934cc19e => 332
	i64 8264926008854159966, ; 370: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 371: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 372: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 373: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 374: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 225
	i64 8400357532724379117, ; 375: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 257
	i64 8410671156615598628, ; 376: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8415323088812168844, ; 377: zh-Hans/System.ServiceModel.NetNamedPipe.resources.dll => 0x74c93bc352cad68c => 373
	i64 8426919725312979251, ; 378: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 246
	i64 8493978365339866546, ; 379: pt-BR/System.ServiceModel.NetTcp.resources.dll => 0x75e0ac51fbef95b2 => 383
	i64 8518412311883997971, ; 380: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8542466152599865324, ; 381: it/System.ServiceModel.Http.resources.dll => 0x768cefb4b38347ec => 340
	i64 8563666267364444763, ; 382: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 383: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 236
	i64 8601935802264776013, ; 384: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 269
	i64 8614108721271900878, ; 385: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 310
	i64 8623059219396073920, ; 386: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 387: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 388: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 389: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 256
	i64 8648495978913578441, ; 390: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8655680948164704764, ; 391: cs/System.ServiceModel.NetFramingBase.resources.dll => 0x781f27f66c7939fc => 349
	i64 8677882282824630478, ; 392: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 310
	i64 8684531736582871431, ; 393: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 394: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8740610862248308472, ; 395: Microsoft.IdentityModel.Tokens.Saml.dll => 0x794ce344fc3b2ef8 => 187
	i64 8750104989811284373, ; 396: zh-Hant\System.ServiceModel.NetFramingBase.resources => 0x796e9e20d1131995 => 361
	i64 8840200626854743040, ; 397: it/System.ServiceModel.NetTcp.resources.dll => 0x7aaeb3a1fadccc00 => 379
	i64 8853378295825400934, ; 398: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 284
	i64 8889036152528886433, ; 399: zh-Hans/System.ServiceModel.Primitives.resources.dll => 0x7b5c3348db16daa1 => 399
	i64 8941376889969657626, ; 400: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 401: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 259
	i64 8954753533646919997, ; 402: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9016070251403168609, ; 403: tr/System.ServiceModel.Primitives.resources.dll => 0x7d1f841fdcda4b61 => 398
	i64 9018795066006812985, ; 404: de/System.ServiceModel.NetTcp.resources.dll => 0x7d2932543361b939 => 376
	i64 9045785047181495996, ; 405: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 320
	i64 9138683372487561558, ; 406: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9206439850007503396, ; 407: pl\System.ServiceModel.NetTcp.resources => 0x7fc3d84409b2a224 => 382
	i64 9236758604623169489, ; 408: es\System.ServiceModel.Http.resources => 0x802f8f033098c7d1 => 338
	i64 9312692141327339315, ; 409: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 274
	i64 9313552142646974434, ; 410: fr/System.ServiceModel.NetNamedPipe.resources.dll => 0x81406254138d17e2 => 365
	i64 9324707631942237306, ; 411: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 215
	i64 9427266486299436557, ; 412: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 184
	i64 9429125686736324352, ; 413: zh-Hans\System.ServiceModel.NetFramingBase.resources => 0x82dafbdabc6e0700 => 360
	i64 9468215723722196442, ; 414: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9488613780052192518, ; 415: cs/System.ServiceModel.Http.resources.dll => 0x83ae53f5cae32d06 => 336
	i64 9554839972845591462, ; 416: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 417: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 279
	i64 9584643793929893533, ; 418: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9659729154652888475, ; 419: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 420: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 421: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 422: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 226
	i64 9702891218465930390, ; 423: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9724288661446775860, ; 424: it/System.ServiceModel.Primitives.resources.dll => 0x86f39d041ee4d434 => 392
	i64 9733213995311057333, ; 425: es\System.ServiceModel.Federation.resources => 0x8713528f596049b5 => 325
	i64 9780093022148426479, ; 426: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 276
	i64 9808709177481450983, ; 427: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 428: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 223
	i64 9834056768316610435, ; 429: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 430: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9907349773706910547, ; 431: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 236
	i64 9913641436950702900, ; 432: pt-BR/System.ServiceModel.Federation.resources.dll => 0x8994545cb80a2b34 => 331
	i64 9933555792566666578, ; 433: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 434: Microsoft.Maui => 0x8a2b8315b36616ac => 192
	i64 9974604633896246661, ; 435: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 436: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 295
	i64 10017511394021241210, ; 437: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 180
	i64 10038780035334861115, ; 438: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 439: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10055713941375345720, ; 440: fr/System.ServiceModel.Http.resources.dll => 0x8b8d128d5e9ee438 => 339
	i64 10078727084704864206, ; 441: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 442: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 443: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 190
	i64 10096670194649521199, ; 444: System.ServiceModel.Primitives => 0x8c1e940c2e5bdc2f => 203
	i64 10105485790837105934, ; 445: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 446: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 292
	i64 10197415184292957254, ; 447: ko\System.ServiceModel.Federation.resources => 0x8d847f14f6f4cc46 => 329
	i64 10226222362177979215, ; 448: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 285
	i64 10229024438826829339, ; 449: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 230
	i64 10236703004850800690, ; 450: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 451: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10252714262739571204, ; 452: Microsoft.Maui.Controls.HotReload.Forms => 0x8e48f54cfe2c5204 => 401
	i64 10321854143672141184, ; 453: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 282
	i64 10360651442923773544, ; 454: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 455: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 456: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 268
	i64 10406448008575299332, ; 457: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 288
	i64 10430153318873392755, ; 458: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 227
	i64 10462231721195350770, ; 459: it\System.ServiceModel.Primitives.resources => 0x91315051b3ac2af2 => 392
	i64 10506226065143327199, ; 460: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 290
	i64 10546663366131771576, ; 461: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 462: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 463: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 464: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 465: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10733493810775535810, ; 466: System.ServiceModel.NetFramingBase.dll => 0x94f507c09e2130c2 => 199
	i64 10785150219063592792, ; 467: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10822644899632537592, ; 468: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 469: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 470: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 217
	i64 10899834349646441345, ; 471: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 472: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 473: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 11002576679268595294, ; 474: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 179
	i64 11009005086950030778, ; 475: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 192
	i64 11018178252090604864, ; 476: Microsoft.IdentityModel.Xml => 0x98e86ebe53cb7d40 => 188
	i64 11019817191295005410, ; 477: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 214
	i64 11023048688141570732, ; 478: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 479: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11071824625609515081, ; 480: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 280
	i64 11103970607964515343, ; 481: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 301
	i64 11136029745144976707, ; 482: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 278
	i64 11157832426039186247, ; 483: System.ServiceModel.NetTcp.dll => 0x9ad8957989669347 => 201
	i64 11162124722117608902, ; 484: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 273
	i64 11163525078381911178, ; 485: es/System.ServiceModel.NetTcp.resources.dll => 0x9aeccee9721e5c8a => 377
	i64 11188319605227840848, ; 486: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11191620716034178705, ; 487: cs/System.ServiceModel.Primitives.resources.dll => 0x9b509fbed81ebe91 => 388
	i64 11220793807500858938, ; 488: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 304
	i64 11226290749488709958, ; 489: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 182
	i64 11235648312900863002, ; 490: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11289176806901695813, ; 491: zh-Hans\System.ServiceModel.Federation.resources => 0x9cab367e45f44545 => 334
	i64 11329751333533450475, ; 492: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 493: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 229
	i64 11347436699239206956, ; 494: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 495: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 258
	i64 11432101114902388181, ; 496: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 497: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 498: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 499: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11503653075602048397, ; 500: System.ServiceModel.Http => 0x9fa52f85f697058d => 198
	i64 11508496261504176197, ; 501: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 239
	i64 11518296021396496455, ; 502: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 302
	i64 11529969570048099689, ; 503: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 273
	i64 11530571088791430846, ; 504: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 178
	i64 11580057168383206117, ; 505: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 212
	i64 11591352189662810718, ; 506: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 266
	i64 11597940890313164233, ; 507: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 508: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 240
	i64 11692977985522001935, ; 509: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 510: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 298
	i64 11707554492040141440, ; 511: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 512: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11949116578634023363, ; 513: zh-Hant\System.ServiceModel.NetTcp.resources => 0xa5d3ca38193641c3 => 387
	i64 11991047634523762324, ; 514: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 515: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12063623837170009990, ; 516: System.Security => 0xa76a99f6ce740786 => 130
	i64 12092606066021995775, ; 517: de/System.ServiceModel.Http.resources.dll => 0xa7d19125cdf994ff => 337
	i64 12096697103934194533, ; 518: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 519: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 520: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 521: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 270
	i64 12145679461940342714, ; 522: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12148258109226484831, ; 523: System.ServiceModel.NetFramingBase => 0xa8974862d834045f => 199
	i64 12153312702598915601, ; 524: ja\System.ServiceModel.NetFramingBase.resources => 0xa8a93d8312a6a611 => 354
	i64 12191646537372739477, ; 525: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 206
	i64 12201331334810686224, ; 526: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 527: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12332222936682028543, ; 528: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12342184558428949313, ; 529: System.ServiceModel.Primitives.dll => 0xab483f76d5780b41 => 203
	i64 12375446203996702057, ; 530: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 531: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 238
	i64 12459464620379313219, ; 532: zh-Hans/System.ServiceModel.NetTcp.resources.dll => 0xace8e90f25419443 => 386
	i64 12466513435562512481, ; 533: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 252
	i64 12475113361194491050, ; 534: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 404
	i64 12487638416075308985, ; 535: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 232
	i64 12517810545449516888, ; 536: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 537: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 220
	i64 12550732019250633519, ; 538: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12563362775336008096, ; 539: de\System.ServiceModel.Http.resources => 0xae5a07e17044b9a0 => 337
	i64 12594160867402462460, ; 540: fr\System.ServiceModel.NetNamedPipe.resources => 0xaec7729509a634fc => 365
	i64 12681088699309157496, ; 541: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 303
	i64 12689340720648847063, ; 542: es/System.ServiceModel.NetNamedPipe.resources.dll => 0xb0199827882c7ed7 => 364
	i64 12699999919562409296, ; 543: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 544: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 221
	i64 12708238894395270091, ; 545: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 546: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 547: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 548: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 275
	i64 12823819093633476069, ; 549: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 316
	i64 12828192437253469131, ; 550: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 286
	i64 12835242264250840079, ; 551: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 552: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 183
	i64 12843770487262409629, ; 553: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 554: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12925973142558461920, ; 555: de\System.ServiceModel.NetTcp.resources => 0xb3624816a26fcfe0 => 376
	i64 12982280885948128408, ; 556: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 231
	i64 12986944878231358355, ; 557: ko/System.ServiceModel.NetTcp.resources.dll => 0xb43ae58f188f0b93 => 381
	i64 13068258254871114833, ; 558: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13113583242634760252, ; 559: Microsoft.IdentityModel.Protocols.WsTrust.dll => 0xb5fcce7afdc2903c => 185
	i64 13129914918964716986, ; 560: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 235
	i64 13173818576982874404, ; 561: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 562: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 290
	i64 13222659110913276082, ; 563: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 304
	i64 13239552802928723181, ; 564: tr/System.ServiceModel.Federation.resources.dll => 0xb7bc5720cb9804ed => 333
	i64 13343850469010654401, ; 565: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 566: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 567: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 298
	i64 13401370062847626945, ; 568: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 270
	i64 13404347523447273790, ; 569: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 225
	i64 13431476299110033919, ; 570: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13450080985297233383, ; 571: pt-BR/System.ServiceModel.Primitives.resources.dll => 0xbaa8496500e0a5e7 => 396
	i64 13454009404024712428, ; 572: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 281
	i64 13463706743370286408, ; 573: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 574: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 283
	i64 13467053111158216594, ; 575: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 318
	i64 13491513212026656886, ; 576: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 218
	i64 13540124433173649601, ; 577: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 319
	i64 13545416393490209236, ; 578: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 302
	i64 13572454107664307259, ; 579: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 260
	i64 13578472628727169633, ; 580: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 581: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 582: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 231
	i64 13647894001087880694, ; 583: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 584: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 211
	i64 13702626353344114072, ; 585: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 586: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 587: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 588: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 589: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 297
	i64 13768883594457632599, ; 590: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13805425092083240321, ; 591: ja/System.ServiceModel.Http.resources.dll => 0xbf96b8fa1ae2cd81 => 341
	i64 13806364379217932032, ; 592: pt-BR/System.ServiceModel.NetFramingBase.resources.dll => 0xbf9a0f40eee42f00 => 357
	i64 13814445057219246765, ; 593: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 300
	i64 13828521679616088467, ; 594: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 284
	i64 13830070810343648044, ; 595: System.ServiceModel.Http.dll => 0xbfee48208d082b2c => 198
	i64 13874392747353528814, ; 596: it\System.ServiceModel.Federation.resources => 0xc08bbeb1ac4359ee => 327
	i64 13881769479078963060, ; 597: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 598: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 599: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13947035440391415689, ; 600: zh-Hans\System.ServiceModel.Primitives.resources => 0xc18dd2d6a6506789 => 399
	i64 13959074834287824816, ; 601: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 238
	i64 14062537208056738663, ; 602: cs\System.ServiceModel.NetNamedPipe.resources => 0xc3282b158eef7367 => 362
	i64 14075334701871371868, ; 603: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14100563506285742564, ; 604: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 292
	i64 14124974489674258913, ; 605: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 220
	i64 14125464355221830302, ; 606: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14178052285788134900, ; 607: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 207
	i64 14212104595480609394, ; 608: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 609: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 610: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 611: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254202117188122242, ; 612: pl/System.ServiceModel.NetNamedPipe.resources.dll => 0xc5d1194db79e7682 => 369
	i64 14254574811015963973, ; 613: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 614: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 258
	i64 14298246716367104064, ; 615: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 616: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 617: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 618: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 208
	i64 14346402571976470310, ; 619: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14461014870687870182, ; 620: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 621: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 313
	i64 14486659737292545672, ; 622: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 243
	i64 14495724990987328804, ; 623: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 261
	i64 14497605124368440498, ; 624: pt-BR\System.ServiceModel.NetFramingBase.resources => 0xc931d70c8bdd1cb2 => 357
	i64 14522721392235705434, ; 625: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 294
	i64 14551742072151931844, ; 626: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 627: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 628: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14622043554576106986, ; 629: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 630: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 253
	i64 14669215534098758659, ; 631: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 176
	i64 14690985099581930927, ; 632: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 633: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 305
	i64 14741804258040025864, ; 634: es\System.ServiceModel.NetNamedPipe.resources => 0xcc9568de04d11308 => 364
	i64 14744092281598614090, ; 635: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 321
	i64 14750216453141343598, ; 636: ja\System.ServiceModel.Http.resources => 0xccb34bb6d19cad6e => 341
	i64 14792063746108907174, ; 637: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 281
	i64 14792991364388157008, ; 638: es\System.ServiceModel.NetTcp.resources => 0xcd4b4344efc6f650 => 377
	i64 14832630590065248058, ; 639: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14839664071391251657, ; 640: System.ServiceModel.Duplex => 0xcdf113d959670cc9 => 202
	i64 14852515768018889994, ; 641: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 229
	i64 14870951093111881137, ; 642: zh-Hans\System.ServiceModel.NetTcp.resources => 0xce603b3ac123fdb1 => 386
	i64 14889905118082851278, ; 643: GoogleGson.dll => 0xcea391d0969961ce => 173
	i64 14892012299694389861, ; 644: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 322
	i64 14904040806490515477, ; 645: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 289
	i64 14905769933452734130, ; 646: es/System.ServiceModel.NetFramingBase.resources.dll => 0xcedbeec7c325eeb2 => 351
	i64 14912225920358050525, ; 647: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 648: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 649: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 177
	i64 14984936317414011727, ; 650: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 651: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 652: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 232
	i64 15015154896917945444, ; 653: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 654: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15033183115947713165, ; 655: cs\System.ServiceModel.Primitives.resources => 0xd0a098650d76a28d => 388
	i64 15071021337266399595, ; 656: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 657: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 658: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 306
	i64 15115185479366240210, ; 659: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 660: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 661: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 259
	i64 15209599533829826619, ; 662: tr/System.ServiceModel.NetTcp.resources.dll => 0xd3135a312ddfa83b => 385
	i64 15227001540531775957, ; 663: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 175
	i64 15234786388537674379, ; 664: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 665: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 666: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 222
	i64 15279429628684179188, ; 667: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 287
	i64 15299439993936780255, ; 668: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15338463749992804988, ; 669: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370334346939861994, ; 670: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 227
	i64 15391712275433856905, ; 671: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 177
	i64 15403947811736892499, ; 672: tr/System.ServiceModel.Http.resources.dll => 0xd5c5d0ebd13bb453 => 346
	i64 15412490934096474927, ; 673: System.ServiceModel.Federation => 0xd5e42ad87ebfb32f => 197
	i64 15413989682962769581, ; 674: es\System.ServiceModel.Primitives.resources => 0xd5e97df3288826ad => 390
	i64 15472743225642400231, ; 675: zh-Hant\System.ServiceModel.Federation.resources => 0xd6ba39fc513f39e7 => 335
	i64 15512084913707906237, ; 676: pt-BR\System.ServiceModel.Http.resources => 0xd745ff0adf4174bd => 344
	i64 15526743539506359484, ; 677: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 678: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 679: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 680: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 293
	i64 15541854775306130054, ; 681: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 682: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15582737692548360875, ; 683: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 251
	i64 15609085926864131306, ; 684: System.dll => 0xd89e9cf3334914ea => 164
	i64 15614406846227935001, ; 685: ko/System.ServiceModel.NetNamedPipe.resources.dll => 0xd8b1844c47d7ef19 => 368
	i64 15637857104874081957, ; 686: System.ServiceModel.NetNamedPipe => 0xd904d42f18568ea5 => 200
	i64 15661133872274321916, ; 687: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 688: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 293
	i64 15710114879900314733, ; 689: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 690: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 301
	i64 15755368083429170162, ; 691: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 692: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 265
	i64 15783653065526199428, ; 693: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 294
	i64 15796674544955155030, ; 694: zh-Hant/System.ServiceModel.Http.resources.dll => 0xdb390fcde481e256 => 348
	i64 15817206913877585035, ; 695: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15847085070278954535, ; 696: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 697: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 698: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 189
	i64 15934062614519587357, ; 699: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 700: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 701: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15968726545588960902, ; 702: pl/System.ServiceModel.NetFramingBase.resources.dll => 0xdd9c502ff12e3e86 => 356
	i64 15971679995444160383, ; 703: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 704: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16046481083542319511, ; 705: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 181
	i64 16054465462676478687, ; 706: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16114460324092078703, ; 707: Microsoft.IdentityModel.Xml.dll => 0xdfa2104964a26a6f => 188
	i64 16154507427712707110, ; 708: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 709: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16272480664611126357, ; 710: fr\System.ServiceModel.NetFramingBase.resources => 0xe1d376f2fc8efc55 => 352
	i64 16288847719894691167, ; 711: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 307
	i64 16315482530584035869, ; 712: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 713: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 179
	i64 16337011941688632206, ; 714: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 715: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 237
	i64 16423015068819898779, ; 716: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 286
	i64 16454459195343277943, ; 717: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16465012559999924934, ; 718: ko\System.ServiceModel.NetNamedPipe.resources => 0xe47f79b01d23fac6 => 368
	i64 16496768397145114574, ; 719: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16506257789526125213, ; 720: tr/System.ServiceModel.NetFramingBase.resources.dll => 0xe512020173baaa9d => 359
	i64 16571052248489204195, ; 721: es\System.ServiceModel.NetFramingBase.resources => 0xe5f8343909a319e3 => 351
	i64 16589693266713801121, ; 722: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 250
	i64 16621146507174665210, ; 723: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 224
	i64 16649148416072044166, ; 724: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 194
	i64 16677317093839702854, ; 725: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 257
	i64 16702652415771857902, ; 726: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 727: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 728: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 729: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 730: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 731: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16775237837682019207, ; 732: de/System.ServiceModel.NetFramingBase.resources.dll => 0xe8cd9def31ba8b87 => 350
	i64 16822611501064131242, ; 733: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 734: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 735: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 736: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 737: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 738: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 314
	i64 16944803401888012179, ; 739: fr/System.ServiceModel.NetFramingBase.resources.dll => 0xeb2808eaa65d9793 => 352
	i64 16977952268158210142, ; 740: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 741: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 250
	i64 16998075588627545693, ; 742: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 255
	i64 17008137082415910100, ; 743: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17023676497273798524, ; 744: es/System.ServiceModel.Http.resources.dll => 0xec403f94372bbf7c => 338
	i64 17024911836938395553, ; 745: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 213
	i64 17026344819618783825, ; 746: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0xec49ba676cb0a251 => 403
	i64 17031351772568316411, ; 747: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 254
	i64 17031924682156397346, ; 748: pl\System.ServiceModel.Primitives.resources => 0xec5d8d426923d322 => 395
	i64 17037200463775726619, ; 749: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 241
	i64 17062143951396181894, ; 750: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 751: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 321
	i64 17101677393452997189, ; 752: de\System.ServiceModel.Federation.resources => 0xed555cfb14181a45 => 324
	i64 17118171214553292978, ; 753: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17137864900836977098, ; 754: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 186
	i64 17163719922865397202, ; 755: cs/System.ServiceModel.Federation.resources.dll => 0xee31c85522afddd2 => 323
	i64 17187273293601214786, ; 756: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 757: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 758: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17230721278011714856, ; 759: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 760: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 761: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17294651574986203234, ; 762: pl/System.ServiceModel.Http.resources.dll => 0xf002f1f9f933e062 => 343
	i64 17333249706306540043, ; 763: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 764: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 765: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 299
	i64 17360349973592121190, ; 766: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 279
	i64 17367298616515891650, ; 767: fr/System.ServiceModel.Federation.resources.dll => 0xf1050a13699011c2 => 326
	i64 17382160109067067964, ; 768: cs/System.ServiceModel.NetNamedPipe.resources.dll => 0xf139d68649e8623c => 362
	i64 17438153253682247751, ; 769: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 314
	i64 17470386307322966175, ; 770: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 771: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 772: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 297
	i64 17522591619082469157, ; 773: GoogleGson => 0xf32cc03d27a5bf25 => 173
	i64 17556740846514848528, ; 774: zh-Hant/System.ServiceModel.NetTcp.resources.dll => 0xf3a612c7c21bc310 => 387
	i64 17590473451926037903, ; 775: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 206
	i64 17623389608345532001, ; 776: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 309
	i64 17627500474728259406, ; 777: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685511033268820096, ; 778: zh-Hans\System.ServiceModel.NetNamedPipe.resources => 0xf56f8e95393d5880 => 373
	i64 17685921127322830888, ; 779: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 780: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 320
	i64 17704177640604968747, ; 781: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 252
	i64 17710060891934109755, ; 782: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 249
	i64 17712670374920797664, ; 783: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17777860260071588075, ; 784: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17790600151040787804, ; 785: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 184
	i64 17838668724098252521, ; 786: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17871147545075994307, ; 787: cs\System.ServiceModel.NetFramingBase.resources => 0xf8031201c0d94ec3 => 349
	i64 17891337867145587222, ; 788: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 282
	i64 17928294245072900555, ; 789: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17992315986609351877, ; 790: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18025913125965088385, ; 791: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 792: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 308
	i64 18116111925905154859, ; 793: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 218
	i64 18121036031235206392, ; 794: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 254
	i64 18146411883821974900, ; 795: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 796: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 797: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 195
	i64 18225059387460068507, ; 798: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 799: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 800: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 235
	i64 18274843375259426212, ; 801: pt-BR/System.ServiceModel.Http.resources.dll => 0xfd9d4939bc3d1da4 => 344
	i64 18305135509493619199, ; 802: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 256
	i64 18318849532986632368, ; 803: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 804: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 303
	i64 18330954238200775945, ; 805: TaskyAndroid.dll => 0xfe64a1c211e60509 => 0
	i64 18362437444048002214, ; 806: tr\System.ServiceModel.Primitives.resources => 0xfed47b9126d01ca6 => 398
	i64 18380184030268848184, ; 807: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 272
	i64 18428404840311395189, ; 808: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 196
	i64 18439108438687598470 ; 809: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [810 x i32] [
	i32 234, ; 0
	i32 201, ; 1
	i32 372, ; 2
	i32 183, ; 3
	i32 171, ; 4
	i32 193, ; 5
	i32 367, ; 6
	i32 200, ; 7
	i32 390, ; 8
	i32 58, ; 9
	i32 221, ; 10
	i32 151, ; 11
	i32 262, ; 12
	i32 197, ; 13
	i32 265, ; 14
	i32 228, ; 15
	i32 330, ; 16
	i32 132, ; 17
	i32 359, ; 18
	i32 329, ; 19
	i32 403, ; 20
	i32 354, ; 21
	i32 56, ; 22
	i32 264, ; 23
	i32 204, ; 24
	i32 397, ; 25
	i32 181, ; 26
	i32 296, ; 27
	i32 95, ; 28
	i32 400, ; 29
	i32 247, ; 30
	i32 129, ; 31
	i32 0, ; 32
	i32 202, ; 33
	i32 145, ; 34
	i32 222, ; 35
	i32 18, ; 36
	i32 299, ; 37
	i32 233, ; 38
	i32 248, ; 39
	i32 150, ; 40
	i32 104, ; 41
	i32 95, ; 42
	i32 335, ; 43
	i32 367, ; 44
	i32 277, ; 45
	i32 307, ; 46
	i32 384, ; 47
	i32 36, ; 48
	i32 28, ; 49
	i32 217, ; 50
	i32 187, ; 51
	i32 380, ; 52
	i32 255, ; 53
	i32 50, ; 54
	i32 115, ; 55
	i32 347, ; 56
	i32 70, ; 57
	i32 190, ; 58
	i32 65, ; 59
	i32 170, ; 60
	i32 145, ; 61
	i32 305, ; 62
	i32 276, ; 63
	i32 394, ; 64
	i32 216, ; 65
	i32 251, ; 66
	i32 241, ; 67
	i32 40, ; 68
	i32 89, ; 69
	i32 346, ; 70
	i32 81, ; 71
	i32 66, ; 72
	i32 62, ; 73
	i32 326, ; 74
	i32 86, ; 75
	i32 215, ; 76
	i32 374, ; 77
	i32 106, ; 78
	i32 295, ; 79
	i32 262, ; 80
	i32 400, ; 81
	i32 102, ; 82
	i32 35, ; 83
	i32 212, ; 84
	i32 317, ; 85
	i32 264, ; 86
	i32 191, ; 87
	i32 317, ; 88
	i32 119, ; 89
	i32 332, ; 90
	i32 249, ; 91
	i32 291, ; 92
	i32 309, ; 93
	i32 142, ; 94
	i32 384, ; 95
	i32 141, ; 96
	i32 285, ; 97
	i32 53, ; 98
	i32 35, ; 99
	i32 141, ; 100
	i32 209, ; 101
	i32 219, ; 102
	i32 363, ; 103
	i32 379, ; 104
	i32 180, ; 105
	i32 233, ; 106
	i32 397, ; 107
	i32 8, ; 108
	i32 14, ; 109
	i32 313, ; 110
	i32 261, ; 111
	i32 350, ; 112
	i32 51, ; 113
	i32 244, ; 114
	i32 343, ; 115
	i32 136, ; 116
	i32 101, ; 117
	i32 226, ; 118
	i32 271, ; 119
	i32 116, ; 120
	i32 210, ; 121
	i32 163, ; 122
	i32 316, ; 123
	i32 186, ; 124
	i32 166, ; 125
	i32 67, ; 126
	i32 176, ; 127
	i32 291, ; 128
	i32 374, ; 129
	i32 80, ; 130
	i32 380, ; 131
	i32 101, ; 132
	i32 266, ; 133
	i32 117, ; 134
	i32 296, ; 135
	i32 278, ; 136
	i32 78, ; 137
	i32 277, ; 138
	i32 402, ; 139
	i32 348, ; 140
	i32 353, ; 141
	i32 114, ; 142
	i32 121, ; 143
	i32 48, ; 144
	i32 395, ; 145
	i32 128, ; 146
	i32 363, ; 147
	i32 242, ; 148
	i32 213, ; 149
	i32 82, ; 150
	i32 110, ; 151
	i32 328, ; 152
	i32 75, ; 153
	i32 288, ; 154
	i32 193, ; 155
	i32 53, ; 156
	i32 268, ; 157
	i32 174, ; 158
	i32 69, ; 159
	i32 267, ; 160
	i32 83, ; 161
	i32 172, ; 162
	i32 381, ; 163
	i32 356, ; 164
	i32 311, ; 165
	i32 116, ; 166
	i32 205, ; 167
	i32 175, ; 168
	i32 156, ; 169
	i32 174, ; 170
	i32 185, ; 171
	i32 207, ; 172
	i32 330, ; 173
	i32 167, ; 174
	i32 366, ; 175
	i32 260, ; 176
	i32 234, ; 177
	i32 339, ; 178
	i32 178, ; 179
	i32 32, ; 180
	i32 191, ; 181
	i32 122, ; 182
	i32 72, ; 183
	i32 334, ; 184
	i32 62, ; 185
	i32 161, ; 186
	i32 113, ; 187
	i32 88, ; 188
	i32 189, ; 189
	i32 342, ; 190
	i32 322, ; 191
	i32 105, ; 192
	i32 18, ; 193
	i32 146, ; 194
	i32 118, ; 195
	i32 58, ; 196
	i32 228, ; 197
	i32 17, ; 198
	i32 391, ; 199
	i32 333, ; 200
	i32 52, ; 201
	i32 92, ; 202
	i32 402, ; 203
	i32 345, ; 204
	i32 336, ; 205
	i32 319, ; 206
	i32 366, ; 207
	i32 55, ; 208
	i32 401, ; 209
	i32 129, ; 210
	i32 393, ; 211
	i32 382, ; 212
	i32 152, ; 213
	i32 41, ; 214
	i32 92, ; 215
	i32 353, ; 216
	i32 396, ; 217
	i32 272, ; 218
	i32 50, ; 219
	i32 289, ; 220
	i32 162, ; 221
	i32 13, ; 222
	i32 246, ; 223
	i32 210, ; 224
	i32 267, ; 225
	i32 36, ; 226
	i32 67, ; 227
	i32 109, ; 228
	i32 211, ; 229
	i32 393, ; 230
	i32 99, ; 231
	i32 327, ; 232
	i32 99, ; 233
	i32 11, ; 234
	i32 345, ; 235
	i32 11, ; 236
	i32 253, ; 237
	i32 25, ; 238
	i32 128, ; 239
	i32 76, ; 240
	i32 245, ; 241
	i32 109, ; 242
	i32 378, ; 243
	i32 355, ; 244
	i32 271, ; 245
	i32 269, ; 246
	i32 106, ; 247
	i32 2, ; 248
	i32 389, ; 249
	i32 26, ; 250
	i32 224, ; 251
	i32 157, ; 252
	i32 315, ; 253
	i32 21, ; 254
	i32 318, ; 255
	i32 49, ; 256
	i32 43, ; 257
	i32 126, ; 258
	i32 214, ; 259
	i32 59, ; 260
	i32 119, ; 261
	i32 204, ; 262
	i32 274, ; 263
	i32 237, ; 264
	i32 223, ; 265
	i32 3, ; 266
	i32 391, ; 267
	i32 371, ; 268
	i32 394, ; 269
	i32 243, ; 270
	i32 385, ; 271
	i32 323, ; 272
	i32 263, ; 273
	i32 383, ; 274
	i32 38, ; 275
	i32 124, ; 276
	i32 312, ; 277
	i32 263, ; 278
	i32 378, ; 279
	i32 312, ; 280
	i32 137, ; 281
	i32 149, ; 282
	i32 85, ; 283
	i32 90, ; 284
	i32 355, ; 285
	i32 247, ; 286
	i32 404, ; 287
	i32 328, ; 288
	i32 244, ; 289
	i32 325, ; 290
	i32 300, ; 291
	i32 219, ; 292
	i32 342, ; 293
	i32 230, ; 294
	i32 275, ; 295
	i32 182, ; 296
	i32 280, ; 297
	i32 245, ; 298
	i32 133, ; 299
	i32 372, ; 300
	i32 96, ; 301
	i32 3, ; 302
	i32 308, ; 303
	i32 340, ; 304
	i32 105, ; 305
	i32 311, ; 306
	i32 33, ; 307
	i32 154, ; 308
	i32 158, ; 309
	i32 324, ; 310
	i32 155, ; 311
	i32 82, ; 312
	i32 375, ; 313
	i32 239, ; 314
	i32 331, ; 315
	i32 196, ; 316
	i32 143, ; 317
	i32 87, ; 318
	i32 370, ; 319
	i32 19, ; 320
	i32 240, ; 321
	i32 195, ; 322
	i32 51, ; 323
	i32 209, ; 324
	i32 361, ; 325
	i32 315, ; 326
	i32 61, ; 327
	i32 54, ; 328
	i32 4, ; 329
	i32 97, ; 330
	i32 375, ; 331
	i32 208, ; 332
	i32 371, ; 333
	i32 17, ; 334
	i32 360, ; 335
	i32 389, ; 336
	i32 155, ; 337
	i32 84, ; 338
	i32 205, ; 339
	i32 369, ; 340
	i32 29, ; 341
	i32 45, ; 342
	i32 64, ; 343
	i32 66, ; 344
	i32 306, ; 345
	i32 172, ; 346
	i32 248, ; 347
	i32 1, ; 348
	i32 283, ; 349
	i32 47, ; 350
	i32 24, ; 351
	i32 216, ; 352
	i32 165, ; 353
	i32 108, ; 354
	i32 358, ; 355
	i32 12, ; 356
	i32 242, ; 357
	i32 63, ; 358
	i32 27, ; 359
	i32 23, ; 360
	i32 93, ; 361
	i32 370, ; 362
	i32 168, ; 363
	i32 347, ; 364
	i32 12, ; 365
	i32 358, ; 366
	i32 287, ; 367
	i32 194, ; 368
	i32 332, ; 369
	i32 29, ; 370
	i32 103, ; 371
	i32 14, ; 372
	i32 126, ; 373
	i32 225, ; 374
	i32 257, ; 375
	i32 91, ; 376
	i32 373, ; 377
	i32 246, ; 378
	i32 383, ; 379
	i32 9, ; 380
	i32 340, ; 381
	i32 86, ; 382
	i32 236, ; 383
	i32 269, ; 384
	i32 310, ; 385
	i32 71, ; 386
	i32 168, ; 387
	i32 1, ; 388
	i32 256, ; 389
	i32 5, ; 390
	i32 349, ; 391
	i32 310, ; 392
	i32 44, ; 393
	i32 27, ; 394
	i32 187, ; 395
	i32 361, ; 396
	i32 379, ; 397
	i32 284, ; 398
	i32 399, ; 399
	i32 158, ; 400
	i32 259, ; 401
	i32 112, ; 402
	i32 398, ; 403
	i32 376, ; 404
	i32 320, ; 405
	i32 121, ; 406
	i32 382, ; 407
	i32 338, ; 408
	i32 274, ; 409
	i32 365, ; 410
	i32 215, ; 411
	i32 184, ; 412
	i32 360, ; 413
	i32 159, ; 414
	i32 336, ; 415
	i32 131, ; 416
	i32 279, ; 417
	i32 57, ; 418
	i32 138, ; 419
	i32 83, ; 420
	i32 30, ; 421
	i32 226, ; 422
	i32 10, ; 423
	i32 392, ; 424
	i32 325, ; 425
	i32 276, ; 426
	i32 171, ; 427
	i32 223, ; 428
	i32 150, ; 429
	i32 94, ; 430
	i32 236, ; 431
	i32 331, ; 432
	i32 60, ; 433
	i32 192, ; 434
	i32 157, ; 435
	i32 295, ; 436
	i32 180, ; 437
	i32 64, ; 438
	i32 88, ; 439
	i32 339, ; 440
	i32 79, ; 441
	i32 47, ; 442
	i32 190, ; 443
	i32 203, ; 444
	i32 143, ; 445
	i32 292, ; 446
	i32 329, ; 447
	i32 285, ; 448
	i32 230, ; 449
	i32 74, ; 450
	i32 91, ; 451
	i32 401, ; 452
	i32 282, ; 453
	i32 135, ; 454
	i32 90, ; 455
	i32 268, ; 456
	i32 288, ; 457
	i32 227, ; 458
	i32 392, ; 459
	i32 290, ; 460
	i32 112, ; 461
	i32 42, ; 462
	i32 159, ; 463
	i32 4, ; 464
	i32 103, ; 465
	i32 199, ; 466
	i32 70, ; 467
	i32 60, ; 468
	i32 39, ; 469
	i32 217, ; 470
	i32 153, ; 471
	i32 56, ; 472
	i32 34, ; 473
	i32 179, ; 474
	i32 192, ; 475
	i32 188, ; 476
	i32 214, ; 477
	i32 21, ; 478
	i32 163, ; 479
	i32 280, ; 480
	i32 301, ; 481
	i32 278, ; 482
	i32 201, ; 483
	i32 273, ; 484
	i32 377, ; 485
	i32 140, ; 486
	i32 388, ; 487
	i32 304, ; 488
	i32 182, ; 489
	i32 89, ; 490
	i32 334, ; 491
	i32 147, ; 492
	i32 229, ; 493
	i32 162, ; 494
	i32 258, ; 495
	i32 6, ; 496
	i32 169, ; 497
	i32 31, ; 498
	i32 107, ; 499
	i32 198, ; 500
	i32 239, ; 501
	i32 302, ; 502
	i32 273, ; 503
	i32 178, ; 504
	i32 212, ; 505
	i32 266, ; 506
	i32 167, ; 507
	i32 240, ; 508
	i32 140, ; 509
	i32 298, ; 510
	i32 59, ; 511
	i32 144, ; 512
	i32 387, ; 513
	i32 81, ; 514
	i32 74, ; 515
	i32 130, ; 516
	i32 337, ; 517
	i32 25, ; 518
	i32 7, ; 519
	i32 93, ; 520
	i32 270, ; 521
	i32 137, ; 522
	i32 199, ; 523
	i32 354, ; 524
	i32 206, ; 525
	i32 113, ; 526
	i32 9, ; 527
	i32 104, ; 528
	i32 203, ; 529
	i32 19, ; 530
	i32 238, ; 531
	i32 386, ; 532
	i32 252, ; 533
	i32 404, ; 534
	i32 232, ; 535
	i32 33, ; 536
	i32 220, ; 537
	i32 46, ; 538
	i32 337, ; 539
	i32 365, ; 540
	i32 303, ; 541
	i32 364, ; 542
	i32 30, ; 543
	i32 221, ; 544
	i32 57, ; 545
	i32 134, ; 546
	i32 114, ; 547
	i32 275, ; 548
	i32 316, ; 549
	i32 286, ; 550
	i32 55, ; 551
	i32 183, ; 552
	i32 6, ; 553
	i32 77, ; 554
	i32 376, ; 555
	i32 231, ; 556
	i32 381, ; 557
	i32 111, ; 558
	i32 185, ; 559
	i32 235, ; 560
	i32 102, ; 561
	i32 290, ; 562
	i32 304, ; 563
	i32 333, ; 564
	i32 170, ; 565
	i32 115, ; 566
	i32 298, ; 567
	i32 270, ; 568
	i32 225, ; 569
	i32 76, ; 570
	i32 396, ; 571
	i32 281, ; 572
	i32 85, ; 573
	i32 283, ; 574
	i32 318, ; 575
	i32 218, ; 576
	i32 319, ; 577
	i32 302, ; 578
	i32 260, ; 579
	i32 160, ; 580
	i32 2, ; 581
	i32 231, ; 582
	i32 24, ; 583
	i32 211, ; 584
	i32 32, ; 585
	i32 117, ; 586
	i32 37, ; 587
	i32 16, ; 588
	i32 297, ; 589
	i32 52, ; 590
	i32 341, ; 591
	i32 357, ; 592
	i32 300, ; 593
	i32 284, ; 594
	i32 198, ; 595
	i32 327, ; 596
	i32 20, ; 597
	i32 123, ; 598
	i32 154, ; 599
	i32 399, ; 600
	i32 238, ; 601
	i32 362, ; 602
	i32 131, ; 603
	i32 292, ; 604
	i32 220, ; 605
	i32 148, ; 606
	i32 207, ; 607
	i32 120, ; 608
	i32 28, ; 609
	i32 132, ; 610
	i32 100, ; 611
	i32 369, ; 612
	i32 134, ; 613
	i32 258, ; 614
	i32 153, ; 615
	i32 97, ; 616
	i32 125, ; 617
	i32 208, ; 618
	i32 69, ; 619
	i32 72, ; 620
	i32 313, ; 621
	i32 243, ; 622
	i32 261, ; 623
	i32 357, ; 624
	i32 294, ; 625
	i32 136, ; 626
	i32 124, ; 627
	i32 71, ; 628
	i32 111, ; 629
	i32 253, ; 630
	i32 176, ; 631
	i32 152, ; 632
	i32 305, ; 633
	i32 364, ; 634
	i32 321, ; 635
	i32 341, ; 636
	i32 281, ; 637
	i32 377, ; 638
	i32 118, ; 639
	i32 202, ; 640
	i32 229, ; 641
	i32 386, ; 642
	i32 173, ; 643
	i32 322, ; 644
	i32 289, ; 645
	i32 351, ; 646
	i32 127, ; 647
	i32 133, ; 648
	i32 177, ; 649
	i32 77, ; 650
	i32 46, ; 651
	i32 232, ; 652
	i32 73, ; 653
	i32 63, ; 654
	i32 388, ; 655
	i32 98, ; 656
	i32 84, ; 657
	i32 306, ; 658
	i32 43, ; 659
	i32 61, ; 660
	i32 259, ; 661
	i32 385, ; 662
	i32 175, ; 663
	i32 37, ; 664
	i32 40, ; 665
	i32 222, ; 666
	i32 287, ; 667
	i32 160, ; 668
	i32 98, ; 669
	i32 227, ; 670
	i32 177, ; 671
	i32 346, ; 672
	i32 197, ; 673
	i32 390, ; 674
	i32 335, ; 675
	i32 344, ; 676
	i32 135, ; 677
	i32 20, ; 678
	i32 65, ; 679
	i32 293, ; 680
	i32 125, ; 681
	i32 75, ; 682
	i32 251, ; 683
	i32 164, ; 684
	i32 368, ; 685
	i32 200, ; 686
	i32 156, ; 687
	i32 293, ; 688
	i32 5, ; 689
	i32 301, ; 690
	i32 49, ; 691
	i32 265, ; 692
	i32 294, ; 693
	i32 348, ; 694
	i32 144, ; 695
	i32 139, ; 696
	i32 100, ; 697
	i32 189, ; 698
	i32 123, ; 699
	i32 120, ; 700
	i32 142, ; 701
	i32 356, ; 702
	i32 39, ; 703
	i32 68, ; 704
	i32 181, ; 705
	i32 41, ; 706
	i32 188, ; 707
	i32 164, ; 708
	i32 73, ; 709
	i32 352, ; 710
	i32 307, ; 711
	i32 165, ; 712
	i32 179, ; 713
	i32 127, ; 714
	i32 237, ; 715
	i32 286, ; 716
	i32 68, ; 717
	i32 368, ; 718
	i32 169, ; 719
	i32 359, ; 720
	i32 351, ; 721
	i32 250, ; 722
	i32 224, ; 723
	i32 194, ; 724
	i32 257, ; 725
	i32 151, ; 726
	i32 45, ; 727
	i32 108, ; 728
	i32 48, ; 729
	i32 96, ; 730
	i32 31, ; 731
	i32 350, ; 732
	i32 23, ; 733
	i32 166, ; 734
	i32 22, ; 735
	i32 138, ; 736
	i32 78, ; 737
	i32 314, ; 738
	i32 352, ; 739
	i32 54, ; 740
	i32 250, ; 741
	i32 255, ; 742
	i32 10, ; 743
	i32 338, ; 744
	i32 213, ; 745
	i32 403, ; 746
	i32 254, ; 747
	i32 395, ; 748
	i32 241, ; 749
	i32 16, ; 750
	i32 321, ; 751
	i32 324, ; 752
	i32 139, ; 753
	i32 186, ; 754
	i32 323, ; 755
	i32 13, ; 756
	i32 15, ; 757
	i32 122, ; 758
	i32 87, ; 759
	i32 149, ; 760
	i32 22, ; 761
	i32 343, ; 762
	i32 34, ; 763
	i32 79, ; 764
	i32 299, ; 765
	i32 279, ; 766
	i32 326, ; 767
	i32 362, ; 768
	i32 314, ; 769
	i32 147, ; 770
	i32 80, ; 771
	i32 297, ; 772
	i32 173, ; 773
	i32 387, ; 774
	i32 206, ; 775
	i32 309, ; 776
	i32 42, ; 777
	i32 373, ; 778
	i32 26, ; 779
	i32 320, ; 780
	i32 252, ; 781
	i32 249, ; 782
	i32 107, ; 783
	i32 110, ; 784
	i32 184, ; 785
	i32 7, ; 786
	i32 349, ; 787
	i32 282, ; 788
	i32 44, ; 789
	i32 161, ; 790
	i32 148, ; 791
	i32 308, ; 792
	i32 218, ; 793
	i32 254, ; 794
	i32 38, ; 795
	i32 15, ; 796
	i32 195, ; 797
	i32 146, ; 798
	i32 8, ; 799
	i32 235, ; 800
	i32 344, ; 801
	i32 256, ; 802
	i32 130, ; 803
	i32 303, ; 804
	i32 0, ; 805
	i32 398, ; 806
	i32 272, ; 807
	i32 196, ; 808
	i32 94 ; 809
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
