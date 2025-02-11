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

@assembly_image_cache = dso_local local_unnamed_addr global [404 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [808 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 233
	i64 44359872337921045, ; 1: System.ServiceModel.NetTcp => 0x9d9911a0fbc415 => 202
	i64 59393587543438216, ; 2: tr/System.ServiceModel.NetNamedPipe.resources.dll => 0xd3022737767388 => 371
	i64 98382396393917666, ; 3: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 183
	i64 120698629574877762, ; 4: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 5: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 193
	i64 162552888780219690, ; 6: ja/System.ServiceModel.NetNamedPipe.resources.dll => 0x24180fdb8f5652a => 366
	i64 176210343261064415, ; 7: System.ServiceModel.NetNamedPipe.dll => 0x272065fa3d34cdf => 201
	i64 189862278688067135, ; 8: es/System.ServiceModel.Primitives.resources.dll => 0x2a286bc8d72ce3f => 389
	i64 196720943101637631, ; 9: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 10: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 220
	i64 229794953483747371, ; 11: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 12: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 261
	i64 233856603507324090, ; 13: System.ServiceModel.Federation.dll => 0x33ed357846ef4ba => 198
	i64 295915112840604065, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 264
	i64 316157742385208084, ; 15: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 227
	i64 329079579674636315, ; 16: pl\System.ServiceModel.Federation.resources => 0x49120225957701b => 329
	i64 350667413455104241, ; 17: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 368310478436231069, ; 18: tr\System.ServiceModel.NetFramingBase.resources => 0x51c806dc23ee79d => 358
	i64 387140843282343205, ; 19: ko/System.ServiceModel.Federation.resources.dll => 0x55f668bb9e3a525 => 328
	i64 396868157601372792, ; 20: Microsoft.VisualStudio.DesignTools.TapContract => 0x581f57c947e5a78 => 402
	i64 413889318740378791, ; 21: ja/System.ServiceModel.NetFramingBase.resources.dll => 0x5be6e247bd944a7 => 353
	i64 422779754995088667, ; 22: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 23: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 263
	i64 439161221770931646, ; 24: System.ServiceModel.Security => 0x61836cdeec86dbe => 204
	i64 519948357370865659, ; 25: ru/System.ServiceModel.Primitives.resources.dll => 0x7373a46b6a367fb => 396
	i64 535107122908063503, ; 26: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 181
	i64 545109961164950392, ; 27: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 295
	i64 560278790331054453, ; 28: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 571911706346497508, ; 29: zh-Hant\System.ServiceModel.Primitives.resources => 0x7efd6aab3aba5e4 => 399
	i64 634308326490598313, ; 30: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 246
	i64 649145001856603771, ; 31: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 671463996660361984, ; 32: TaskyAndroid => 0x95184f28867ab00 => 0
	i64 703889276121812442, ; 33: System.ServiceModel.Duplex.dll => 0x9c4b79138728dda => 197
	i64 750875890346172408, ; 34: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 35: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 221
	i64 799765834175365804, ; 36: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 37: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 298
	i64 872800313462103108, ; 38: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 232
	i64 895210737996778430, ; 39: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 247
	i64 940822596282819491, ; 40: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 41: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 42: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1049216803855315730, ; 43: zh-Hant/System.ServiceModel.Federation.resources.dll => 0xe8f911fc62ab312 => 334
	i64 1106195547578177592, ; 44: ja\System.ServiceModel.NetNamedPipe.resources => 0xf59fefd59841838 => 366
	i64 1120440138749646132, ; 45: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 276
	i64 1121665720830085036, ; 46: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 306
	i64 1166987153734377595, ; 47: ru/System.ServiceModel.NetTcp.resources.dll => 0x1031f8a223c8207b => 383
	i64 1268860745194512059, ; 48: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301626418029409250, ; 49: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 50: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 216
	i64 1320654197929453943, ; 51: Microsoft.IdentityModel.Tokens.Saml => 0x1253e7fef2b6a977 => 187
	i64 1350488117176064860, ; 52: ja\System.ServiceModel.NetTcp.resources => 0x12bde5c991aa5b5c => 379
	i64 1369545283391376210, ; 53: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 254
	i64 1404195534211153682, ; 54: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 55: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1426556759400165484, ; 56: zh-Hans/System.ServiceModel.Http.resources.dll => 0x13cc25d07ffab06c => 346
	i64 1476839205573959279, ; 57: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 58: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 190
	i64 1492954217099365037, ; 59: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 60: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1537168428375924959, ; 61: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 62: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 304
	i64 1576750169145655260, ; 63: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 275
	i64 1617235198659916586, ; 64: ko\System.ServiceModel.Primitives.resources => 0x167192d83e61f32a => 393
	i64 1624659445732251991, ; 65: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 215
	i64 1628611045998245443, ; 66: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 250
	i64 1636321030536304333, ; 67: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 240
	i64 1651782184287836205, ; 68: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 69: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1680559570755486426, ; 70: tr\System.ServiceModel.Http.resources => 0x17528c068ec382da => 345
	i64 1682513316613008342, ; 71: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1735388228521408345, ; 72: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 73: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1764797081625604034, ; 74: fr\System.ServiceModel.Federation.resources => 0x187dd1986ef0afc2 => 325
	i64 1767386781656293639, ; 75: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 76: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 214
	i64 1813473727062752547, ; 77: zh-Hant\System.ServiceModel.NetNamedPipe.resources => 0x192ac0bf1f143d23 => 373
	i64 1825687700144851180, ; 78: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 79: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 294
	i64 1836611346387731153, ; 80: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 261
	i64 1840441330330567270, ; 81: zh-Hant/System.ServiceModel.Primitives.resources.dll => 0x198a8fa38c4d0266 => 399
	i64 1854145951182283680, ; 82: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 83: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 84: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 211
	i64 1881198190668717030, ; 85: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 316
	i64 1897575647115118287, ; 86: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 263
	i64 1920760634179481754, ; 87: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 191
	i64 1959996714666907089, ; 88: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 316
	i64 1972385128188460614, ; 89: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1980725144359361681, ; 90: ru\System.ServiceModel.Federation.resources => 0x1b7cf30643395c91 => 331
	i64 1981742497975770890, ; 91: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 248
	i64 1983698669889758782, ; 92: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 290
	i64 2019660174692588140, ; 93: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 308
	i64 2040001226662520565, ; 94: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2059469483644638515, ; 95: ru\System.ServiceModel.NetTcp.resources => 0x1c94b49576655533 => 383
	i64 2062890601515140263, ; 96: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 97: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 284
	i64 2080945842184875448, ; 98: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 99: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 100: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2165310824878145998, ; 101: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 208
	i64 2165725771938924357, ; 102: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 218
	i64 2179947168683658163, ; 103: de\System.ServiceModel.NetNamedPipe.resources => 0x1e40ba666a820bb3 => 362
	i64 2187820665329845162, ; 104: it\System.ServiceModel.NetTcp.resources => 0x1e5cb34db53e83aa => 378
	i64 2200176636225660136, ; 105: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 180
	i64 2262844636196693701, ; 106: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 232
	i64 2284054589560053283, ; 107: ru\System.ServiceModel.Primitives.resources => 0x1fb2978c3a53de23 => 396
	i64 2287834202362508563, ; 108: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 109: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 110: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 312
	i64 2304837677853103545, ; 111: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 260
	i64 2309964453332250390, ; 112: de\System.ServiceModel.NetFramingBase.resources => 0x200ea46e7ca5ef16 => 349
	i64 2315304989185124968, ; 113: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 114: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 243
	i64 2334065076924874282, ; 115: pl\System.ServiceModel.Http.resources => 0x206443d230c07e2a => 342
	i64 2335503487726329082, ; 116: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 117: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2470498323731680442, ; 118: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 225
	i64 2479423007379663237, ; 119: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 270
	i64 2497223385847772520, ; 120: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 121: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 209
	i64 2592350477072141967, ; 122: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 123: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 315
	i64 2612152650457191105, ; 124: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 186
	i64 2624866290265602282, ; 125: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 126: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 127: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 176
	i64 2662981627730767622, ; 128: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 290
	i64 2700519926408562886, ; 129: zh-Hant/System.ServiceModel.NetNamedPipe.resources.dll => 0x257a2c90aa7248c6 => 373
	i64 2706075432581334785, ; 130: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2760160909669527043, ; 131: ja/System.ServiceModel.NetTcp.resources.dll => 0x264e0fb92fc56e03 => 379
	i64 2783046991838674048, ; 132: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 133: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 265
	i64 2815524396660695947, ; 134: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2895129759130297543, ; 135: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 295
	i64 2923871038697555247, ; 136: Jsr305Binding => 0x2893ad37e69ec52f => 277
	i64 3017136373564924869, ; 137: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 138: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 276
	i64 3062772059105072826, ; 139: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0x2a8126f5e2f316ba => 401
	i64 3075974917408215435, ; 140: zh-Hant\System.ServiceModel.Http.resources => 0x2ab00ee3e220d18b => 347
	i64 3106100055920985814, ; 141: it/System.ServiceModel.NetFramingBase.resources.dll => 0x2b1b158b45fdc6d6 => 352
	i64 3106852385031680087, ; 142: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 143: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 144: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3227901148727174408, ; 145: pl/System.ServiceModel.Primitives.resources.dll => 0x2ccbcefe1bf56508 => 394
	i64 3281594302220646930, ; 146: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3283174272583324799, ; 147: de/System.ServiceModel.NetNamedPipe.resources.dll => 0x2d902d9b1d07d47f => 362
	i64 3289520064315143713, ; 148: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 241
	i64 3303437397778967116, ; 149: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 212
	i64 3311221304742556517, ; 150: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 151: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328758490895923850, ; 152: ja\System.ServiceModel.Federation.resources => 0x2e32203600eaba8a => 327
	i64 3328853167529574890, ; 153: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 154: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 287
	i64 3429672777697402584, ; 155: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 193
	i64 3437845325506641314, ; 156: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 157: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 267
	i64 3494946837667399002, ; 158: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 174
	i64 3508450208084372758, ; 159: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 160: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 266
	i64 3531994851595924923, ; 161: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 162: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3552918255982455594, ; 163: ko\System.ServiceModel.NetTcp.resources => 0x314e805463d5ab2a => 380
	i64 3561390990477819316, ; 164: pl\System.ServiceModel.NetFramingBase.resources => 0x316c9a3c9db4fdb4 => 355
	i64 3567343442040498961, ; 165: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 310
	i64 3571415421602489686, ; 166: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 167: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 175
	i64 3647754201059316852, ; 168: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 169: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 174
	i64 3656732466067224761, ; 170: Microsoft.IdentityModel.Protocols.WsTrust => 0x32bf52cdbe9338b9 => 185
	i64 3659371656528649588, ; 171: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 206
	i64 3661347406458881470, ; 172: pl/System.ServiceModel.Federation.resources.dll => 0x32cfb811494785be => 329
	i64 3716579019761409177, ; 173: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3724788330609220757, ; 174: it\System.ServiceModel.NetNamedPipe.resources => 0x33b11b407d7b9c95 => 365
	i64 3727469159507183293, ; 175: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 259
	i64 3772598417116884899, ; 176: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 233
	i64 3847323185292082162, ; 177: fr\System.ServiceModel.Http.resources => 0x3564700d93757bf2 => 338
	i64 3869221888984012293, ; 178: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 178
	i64 3869649043256705283, ; 179: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3890352374528606784, ; 180: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 191
	i64 3919223565570527920, ; 181: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 182: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3937697360741473042, ; 183: zh-Hans/System.ServiceModel.Federation.resources.dll => 0x36a582e303fd1b12 => 333
	i64 3966267475168208030, ; 184: System.Memory => 0x370b03412596249e => 62
	i64 4006972109285359177, ; 185: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 186: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 187: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 188: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 189
	i64 4119158804516806643, ; 189: ko/System.ServiceModel.Http.resources.dll => 0x392a311bc4a59ff3 => 341
	i64 4120493066591692148, ; 190: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 321
	i64 4148881117810174540, ; 191: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 192: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 193: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 194: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 195: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 196: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 227
	i64 4205801962323029395, ; 197: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4206559769820211150, ; 198: fr/System.ServiceModel.Primitives.resources.dll => 0x3a60b3d2c69527ce => 390
	i64 4234650624138384307, ; 199: tr\System.ServiceModel.Federation.resources => 0x3ac4804e77a793b3 => 332
	i64 4235503420553921860, ; 200: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4282138915307457788, ; 201: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4321177614414309855, ; 202: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x3bf7e8254e88e9df => 401
	i64 4334223412680886043, ; 203: ru/System.ServiceModel.Http.resources.dll => 0x3c26413aea06871b => 344
	i64 4351295671783217625, ; 204: cs\System.ServiceModel.Http.resources => 0x3c62e85bfd5559d9 => 335
	i64 4356591372459378815, ; 205: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 318
	i64 4359441015448386636, ; 206: it/System.ServiceModel.NetNamedPipe.resources.dll => 0x3c7fd8819911bc4c => 365
	i64 4373617458794931033, ; 207: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4388777479429739993, ; 208: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x3ce811dd63a4d5d9 => 400
	i64 4397634830160618470, ; 209: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4428882291034034432, ; 210: ja/System.ServiceModel.Primitives.resources.dll => 0x3d768cfa7d1a1100 => 392
	i64 4463560197053177287, ; 211: pl/System.ServiceModel.NetTcp.resources.dll => 0x3df1c059aaed5dc7 => 381
	i64 4477672992252076438, ; 212: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 213: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 214: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4560453051006720631, ; 215: it\System.ServiceModel.NetFramingBase.resources => 0x3f49fbe3381a1a77 => 352
	i64 4616101634287018717, ; 216: pt-BR\System.ServiceModel.Primitives.resources => 0x400faffaaec722dd => 395
	i64 4636684751163556186, ; 217: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 271
	i64 4672453897036726049, ; 218: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 219: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 288
	i64 4716677666592453464, ; 220: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 221: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 222: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 245
	i64 4794310189461587505, ; 223: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 209
	i64 4795410492532947900, ; 224: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 266
	i64 4809057822547766521, ; 225: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 226: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 227: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 228: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 210
	i64 5071398478759053283, ; 229: ja\System.ServiceModel.Primitives.resources => 0x46613a0c08e3c7e3 => 392
	i64 5081566143765835342, ; 230: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5096255990897624623, ; 231: it/System.ServiceModel.Federation.resources.dll => 0x46b989d295e8c62f => 326
	i64 5099468265966638712, ; 232: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 233: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5178715688604046882, ; 234: ru\System.ServiceModel.Http.resources => 0x47de7e7b13fc9622 => 344
	i64 5182934613077526976, ; 235: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 236: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 252
	i64 5244375036463807528, ; 237: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 238: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 239: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 240: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 244
	i64 5290786973231294105, ; 241: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5300219786275769134, ; 242: fr/System.ServiceModel.NetTcp.resources.dll => 0x498e29d05876cb2e => 377
	i64 5375923372247632090, ; 243: ko/System.ServiceModel.NetFramingBase.resources.dll => 0x4a9b1dd2fe8a48da => 354
	i64 5376510917114486089, ; 244: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 270
	i64 5408338804355907810, ; 245: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 268
	i64 5423376490970181369, ; 246: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 247: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5445845718793242646, ; 248: de\System.ServiceModel.Primitives.resources => 0x4b9387d3f240c816 => 388
	i64 5446034149219586269, ; 249: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 250: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 223
	i64 5457765010617926378, ; 251: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 252: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 314
	i64 5507995362134886206, ; 253: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 254: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 317
	i64 5527431512186326818, ; 255: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 256: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 257: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 258: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 213
	i64 5591791169662171124, ; 259: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5650097808083101034, ; 260: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5650370239627215726, ; 261: System.ServiceModel.Security.dll => 0x4e6a25cbc66b436e => 204
	i64 5692067934154308417, ; 262: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 273
	i64 5724799082821825042, ; 263: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 236
	i64 5757522595884336624, ; 264: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 222
	i64 5783556987928984683, ; 265: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5816864004925684276, ; 266: fr\System.ServiceModel.Primitives.resources => 0x50b9a6fe5059fa34 => 390
	i64 5860375757134996729, ; 267: ru/System.ServiceModel.NetNamedPipe.resources.dll => 0x51543cb39657a4f9 => 370
	i64 5867185805380132584, ; 268: ko/System.ServiceModel.Primitives.resources.dll => 0x516c6e6780e59ee8 => 393
	i64 5896680224035167651, ; 269: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 242
	i64 5938631692456801490, ; 270: tr\System.ServiceModel.NetTcp.resources => 0x526a420f60c3b4d2 => 384
	i64 5952455131197516416, ; 271: cs\System.ServiceModel.Federation.resources => 0x529b5e67847aaa80 => 322
	i64 5959344983920014087, ; 272: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 262
	i64 5975693538080295492, ; 273: pt-BR\System.ServiceModel.NetTcp.resources => 0x52eded9cbfdf8a44 => 382
	i64 5979151488806146654, ; 274: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 275: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 276: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 311
	i64 6102788177522843259, ; 277: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 262
	i64 6184291411622536774, ; 278: fr\System.ServiceModel.NetTcp.resources => 0x55d30445e942a646 => 377
	i64 6200764641006662125, ; 279: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 311
	i64 6222399776351216807, ; 280: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 281: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 282: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 283: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6288213823986309268, ; 284: ko\System.ServiceModel.NetFramingBase.resources => 0x5744392812679894 => 354
	i64 6319713645133255417, ; 285: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 246
	i64 6357457916754632952, ; 286: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 403
	i64 6367018942829578670, ; 287: ja/System.ServiceModel.Federation.resources.dll => 0x585c31fe9d8a49ae => 327
	i64 6401687960814735282, ; 288: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 243
	i64 6457407416161890188, ; 289: es/System.ServiceModel.Federation.resources.dll => 0x599d51d50a4d6f8c => 324
	i64 6478287442656530074, ; 290: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 299
	i64 6504860066809920875, ; 291: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 218
	i64 6506916921333231814, ; 292: ko\System.ServiceModel.Http.resources => 0x5a4d3676ff0bb0c6 => 341
	i64 6548213210057960872, ; 293: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 229
	i64 6557084851308642443, ; 294: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 274
	i64 6560151584539558821, ; 295: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 182
	i64 6589202984700901502, ; 296: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 279
	i64 6591971792923354531, ; 297: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 244
	i64 6617685658146568858, ; 298: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6703725107163354527, ; 299: tr\System.ServiceModel.NetNamedPipe.resources => 0x5d086a779456d59f => 371
	i64 6713440830605852118, ; 300: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 301: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 302: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 307
	i64 6750700927172492327, ; 303: it\System.ServiceModel.Http.resources => 0x5daf4eb9fd043c27 => 339
	i64 6772837112740759457, ; 304: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 305: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 310
	i64 6786606130239981554, ; 306: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 307: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 308: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6869993514317880518, ; 309: de/System.ServiceModel.Federation.resources.dll => 0x5f571eb3d6279cc6 => 323
	i64 6876862101832370452, ; 310: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 311: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6994714925497792253, ; 312: cs\System.ServiceModel.NetTcp.resources => 0x6112382a476b36fd => 374
	i64 7011053663211085209, ; 313: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 238
	i64 7041056731259377614, ; 314: pt-BR\System.ServiceModel.Federation.resources => 0x61b6dbcabe1697ce => 330
	i64 7060448593242414269, ; 315: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 196
	i64 7060896174307865760, ; 316: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 317: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7098780445870241465, ; 318: pt-BR/System.ServiceModel.NetNamedPipe.resources.dll => 0x6283ef345e95b6b9 => 369
	i64 7101497697220435230, ; 319: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 320: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 239
	i64 7105430439328552570, ; 321: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 195
	i64 7112547816752919026, ; 322: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7192745174564810625, ; 323: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 208
	i64 7200517792190262741, ; 324: zh-Hant/System.ServiceModel.NetFramingBase.resources.dll => 0x63ed60c832616dd5 => 360
	i64 7220009545223068405, ; 325: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 314
	i64 7270811800166795866, ; 326: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 327: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 328: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 329: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7343975498128436721, ; 330: cs/System.ServiceModel.NetTcp.resources.dll => 0x65eb0ace351e2df1 => 374
	i64 7349431895026339542, ; 331: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 207
	i64 7350910574546538092, ; 332: ru\System.ServiceModel.NetNamedPipe.resources => 0x6603ae3883824e6c => 370
	i64 7377312882064240630, ; 333: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7411086746255647294, ; 334: zh-Hans/System.ServiceModel.NetFramingBase.resources.dll => 0x66d978214e2c623e => 359
	i64 7462724204265000896, ; 335: de/System.ServiceModel.Primitives.resources.dll => 0x6790ec1fe3eccfc0 => 388
	i64 7488575175965059935, ; 336: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 337: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7507338075031127501, ; 338: pl\System.ServiceModel.NetNamedPipe.resources => 0x682f6c3422fec5cd => 368
	i64 7592577537120840276, ; 339: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 340: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 341: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 342: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 343: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 305
	i64 7714652370974252055, ; 344: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 345: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 247
	i64 7735176074855944702, ; 346: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 347: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 282
	i64 7791074099216502080, ; 348: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 349: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 350: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 215
	i64 8025517457475554965, ; 351: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 352: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8046612836032419316, ; 353: ru/System.ServiceModel.NetFramingBase.resources.dll => 0x6fab4fbdd8cf95f4 => 357
	i64 8064050204834738623, ; 354: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 355: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 241
	i64 8085230611270010360, ; 356: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 357: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 358: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 359: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8161788945634753591, ; 360: pt-BR\System.ServiceModel.NetNamedPipe.resources => 0x71447fcd9444fc37 => 369
	i64 8167236081217502503, ; 361: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8174477988419522883, ; 362: zh-Hans\System.ServiceModel.Http.resources => 0x7171946b93fed143 => 346
	i64 8185542183669246576, ; 363: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187568296582843689, ; 364: ru\System.ServiceModel.NetFramingBase.resources => 0x71a015fc74120d29 => 357
	i64 8187640529827139739, ; 365: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 286
	i64 8246048515196606205, ; 366: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 194
	i64 8248431922176115102, ; 367: ru/System.ServiceModel.Federation.resources.dll => 0x72785121934cc19e => 331
	i64 8264926008854159966, ; 368: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 369: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 370: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 371: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 372: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 224
	i64 8400357532724379117, ; 373: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 256
	i64 8410671156615598628, ; 374: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8415323088812168844, ; 375: zh-Hans/System.ServiceModel.NetNamedPipe.resources.dll => 0x74c93bc352cad68c => 372
	i64 8426919725312979251, ; 376: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 245
	i64 8493978365339866546, ; 377: pt-BR/System.ServiceModel.NetTcp.resources.dll => 0x75e0ac51fbef95b2 => 382
	i64 8518412311883997971, ; 378: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8542466152599865324, ; 379: it/System.ServiceModel.Http.resources.dll => 0x768cefb4b38347ec => 339
	i64 8563666267364444763, ; 380: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 381: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 235
	i64 8601935802264776013, ; 382: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 268
	i64 8614108721271900878, ; 383: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 309
	i64 8623059219396073920, ; 384: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 385: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 386: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 387: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 255
	i64 8648495978913578441, ; 388: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8655680948164704764, ; 389: cs/System.ServiceModel.NetFramingBase.resources.dll => 0x781f27f66c7939fc => 348
	i64 8677882282824630478, ; 390: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 309
	i64 8684531736582871431, ; 391: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 392: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8740610862248308472, ; 393: Microsoft.IdentityModel.Tokens.Saml.dll => 0x794ce344fc3b2ef8 => 187
	i64 8750104989811284373, ; 394: zh-Hant\System.ServiceModel.NetFramingBase.resources => 0x796e9e20d1131995 => 360
	i64 8840200626854743040, ; 395: it/System.ServiceModel.NetTcp.resources.dll => 0x7aaeb3a1fadccc00 => 378
	i64 8853378295825400934, ; 396: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 283
	i64 8889036152528886433, ; 397: zh-Hans/System.ServiceModel.Primitives.resources.dll => 0x7b5c3348db16daa1 => 398
	i64 8941376889969657626, ; 398: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 399: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 258
	i64 8954753533646919997, ; 400: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9016070251403168609, ; 401: tr/System.ServiceModel.Primitives.resources.dll => 0x7d1f841fdcda4b61 => 397
	i64 9018795066006812985, ; 402: de/System.ServiceModel.NetTcp.resources.dll => 0x7d2932543361b939 => 375
	i64 9045785047181495996, ; 403: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 319
	i64 9138683372487561558, ; 404: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9206439850007503396, ; 405: pl\System.ServiceModel.NetTcp.resources => 0x7fc3d84409b2a224 => 381
	i64 9236758604623169489, ; 406: es\System.ServiceModel.Http.resources => 0x802f8f033098c7d1 => 337
	i64 9312692141327339315, ; 407: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 273
	i64 9313552142646974434, ; 408: fr/System.ServiceModel.NetNamedPipe.resources.dll => 0x81406254138d17e2 => 364
	i64 9324707631942237306, ; 409: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 214
	i64 9427266486299436557, ; 410: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 184
	i64 9429125686736324352, ; 411: zh-Hans\System.ServiceModel.NetFramingBase.resources => 0x82dafbdabc6e0700 => 359
	i64 9468215723722196442, ; 412: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9488613780052192518, ; 413: cs/System.ServiceModel.Http.resources.dll => 0x83ae53f5cae32d06 => 335
	i64 9554839972845591462, ; 414: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 415: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 278
	i64 9584643793929893533, ; 416: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9659729154652888475, ; 417: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 418: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 419: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 420: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 225
	i64 9702891218465930390, ; 421: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9724288661446775860, ; 422: it/System.ServiceModel.Primitives.resources.dll => 0x86f39d041ee4d434 => 391
	i64 9733213995311057333, ; 423: es\System.ServiceModel.Federation.resources => 0x8713528f596049b5 => 324
	i64 9780093022148426479, ; 424: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 275
	i64 9808709177481450983, ; 425: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 426: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 222
	i64 9834056768316610435, ; 427: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 428: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9907349773706910547, ; 429: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 235
	i64 9913641436950702900, ; 430: pt-BR/System.ServiceModel.Federation.resources.dll => 0x8994545cb80a2b34 => 330
	i64 9933555792566666578, ; 431: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 432: Microsoft.Maui => 0x8a2b8315b36616ac => 192
	i64 9974604633896246661, ; 433: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 434: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 294
	i64 10017511394021241210, ; 435: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 180
	i64 10038780035334861115, ; 436: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 437: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10055713941375345720, ; 438: fr/System.ServiceModel.Http.resources.dll => 0x8b8d128d5e9ee438 => 338
	i64 10078727084704864206, ; 439: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 440: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 441: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 190
	i64 10096670194649521199, ; 442: System.ServiceModel.Primitives => 0x8c1e940c2e5bdc2f => 203
	i64 10105485790837105934, ; 443: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 444: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 291
	i64 10197415184292957254, ; 445: ko\System.ServiceModel.Federation.resources => 0x8d847f14f6f4cc46 => 328
	i64 10226222362177979215, ; 446: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 284
	i64 10229024438826829339, ; 447: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 229
	i64 10236703004850800690, ; 448: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 449: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10252714262739571204, ; 450: Microsoft.Maui.Controls.HotReload.Forms => 0x8e48f54cfe2c5204 => 400
	i64 10321854143672141184, ; 451: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 281
	i64 10360651442923773544, ; 452: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 453: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 454: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 267
	i64 10406448008575299332, ; 455: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 287
	i64 10430153318873392755, ; 456: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 226
	i64 10462231721195350770, ; 457: it\System.ServiceModel.Primitives.resources => 0x91315051b3ac2af2 => 391
	i64 10506226065143327199, ; 458: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 289
	i64 10546663366131771576, ; 459: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 460: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 461: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 462: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 463: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10733493810775535810, ; 464: System.ServiceModel.NetFramingBase.dll => 0x94f507c09e2130c2 => 200
	i64 10785150219063592792, ; 465: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10822644899632537592, ; 466: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 467: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 468: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 216
	i64 10899834349646441345, ; 469: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 470: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 471: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 11002576679268595294, ; 472: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 179
	i64 11009005086950030778, ; 473: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 192
	i64 11018178252090604864, ; 474: Microsoft.IdentityModel.Xml => 0x98e86ebe53cb7d40 => 188
	i64 11019817191295005410, ; 475: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 213
	i64 11023048688141570732, ; 476: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 477: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11071824625609515081, ; 478: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 279
	i64 11103970607964515343, ; 479: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 300
	i64 11136029745144976707, ; 480: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 277
	i64 11157832426039186247, ; 481: System.ServiceModel.NetTcp.dll => 0x9ad8957989669347 => 202
	i64 11162124722117608902, ; 482: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 272
	i64 11163525078381911178, ; 483: es/System.ServiceModel.NetTcp.resources.dll => 0x9aeccee9721e5c8a => 376
	i64 11188319605227840848, ; 484: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11191620716034178705, ; 485: cs/System.ServiceModel.Primitives.resources.dll => 0x9b509fbed81ebe91 => 387
	i64 11220793807500858938, ; 486: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 303
	i64 11226290749488709958, ; 487: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 182
	i64 11235648312900863002, ; 488: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11289176806901695813, ; 489: zh-Hans\System.ServiceModel.Federation.resources => 0x9cab367e45f44545 => 333
	i64 11329751333533450475, ; 490: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 491: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 228
	i64 11347436699239206956, ; 492: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 493: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 257
	i64 11432101114902388181, ; 494: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 495: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 496: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 497: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11503653075602048397, ; 498: System.ServiceModel.Http => 0x9fa52f85f697058d => 199
	i64 11508496261504176197, ; 499: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 238
	i64 11518296021396496455, ; 500: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 301
	i64 11529969570048099689, ; 501: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 272
	i64 11530571088791430846, ; 502: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 178
	i64 11580057168383206117, ; 503: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 211
	i64 11591352189662810718, ; 504: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 265
	i64 11597940890313164233, ; 505: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 506: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 239
	i64 11692977985522001935, ; 507: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 508: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 297
	i64 11707554492040141440, ; 509: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 510: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11949116578634023363, ; 511: zh-Hant\System.ServiceModel.NetTcp.resources => 0xa5d3ca38193641c3 => 386
	i64 11991047634523762324, ; 512: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 513: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12063623837170009990, ; 514: System.Security => 0xa76a99f6ce740786 => 130
	i64 12092606066021995775, ; 515: de/System.ServiceModel.Http.resources.dll => 0xa7d19125cdf994ff => 336
	i64 12096697103934194533, ; 516: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 517: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 518: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 519: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 269
	i64 12145679461940342714, ; 520: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12148258109226484831, ; 521: System.ServiceModel.NetFramingBase => 0xa8974862d834045f => 200
	i64 12153312702598915601, ; 522: ja\System.ServiceModel.NetFramingBase.resources => 0xa8a93d8312a6a611 => 353
	i64 12191646537372739477, ; 523: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 205
	i64 12201331334810686224, ; 524: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 525: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12332222936682028543, ; 526: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12342184558428949313, ; 527: System.ServiceModel.Primitives.dll => 0xab483f76d5780b41 => 203
	i64 12375446203996702057, ; 528: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 529: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 237
	i64 12459464620379313219, ; 530: zh-Hans/System.ServiceModel.NetTcp.resources.dll => 0xace8e90f25419443 => 385
	i64 12466513435562512481, ; 531: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 251
	i64 12475113361194491050, ; 532: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 403
	i64 12487638416075308985, ; 533: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 231
	i64 12517810545449516888, ; 534: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 535: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 219
	i64 12550732019250633519, ; 536: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12563362775336008096, ; 537: de\System.ServiceModel.Http.resources => 0xae5a07e17044b9a0 => 336
	i64 12594160867402462460, ; 538: fr\System.ServiceModel.NetNamedPipe.resources => 0xaec7729509a634fc => 364
	i64 12681088699309157496, ; 539: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 302
	i64 12689340720648847063, ; 540: es/System.ServiceModel.NetNamedPipe.resources.dll => 0xb0199827882c7ed7 => 363
	i64 12699999919562409296, ; 541: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 542: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 220
	i64 12708238894395270091, ; 543: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 544: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 545: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 546: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 274
	i64 12823819093633476069, ; 547: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 315
	i64 12828192437253469131, ; 548: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 285
	i64 12835242264250840079, ; 549: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 550: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 183
	i64 12843770487262409629, ; 551: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 552: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12925973142558461920, ; 553: de\System.ServiceModel.NetTcp.resources => 0xb3624816a26fcfe0 => 375
	i64 12982280885948128408, ; 554: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 230
	i64 12986944878231358355, ; 555: ko/System.ServiceModel.NetTcp.resources.dll => 0xb43ae58f188f0b93 => 380
	i64 13068258254871114833, ; 556: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13113583242634760252, ; 557: Microsoft.IdentityModel.Protocols.WsTrust.dll => 0xb5fcce7afdc2903c => 185
	i64 13129914918964716986, ; 558: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 234
	i64 13173818576982874404, ; 559: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 560: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 289
	i64 13222659110913276082, ; 561: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 303
	i64 13239552802928723181, ; 562: tr/System.ServiceModel.Federation.resources.dll => 0xb7bc5720cb9804ed => 332
	i64 13343850469010654401, ; 563: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 564: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 565: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 297
	i64 13401370062847626945, ; 566: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 269
	i64 13404347523447273790, ; 567: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 224
	i64 13431476299110033919, ; 568: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13450080985297233383, ; 569: pt-BR/System.ServiceModel.Primitives.resources.dll => 0xbaa8496500e0a5e7 => 395
	i64 13454009404024712428, ; 570: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 280
	i64 13463706743370286408, ; 571: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 572: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 282
	i64 13467053111158216594, ; 573: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 317
	i64 13491513212026656886, ; 574: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 217
	i64 13540124433173649601, ; 575: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 318
	i64 13545416393490209236, ; 576: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 301
	i64 13572454107664307259, ; 577: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 259
	i64 13578472628727169633, ; 578: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 579: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 580: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 230
	i64 13647894001087880694, ; 581: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 582: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 210
	i64 13702626353344114072, ; 583: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 584: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 585: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 586: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 587: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 296
	i64 13768883594457632599, ; 588: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13805425092083240321, ; 589: ja/System.ServiceModel.Http.resources.dll => 0xbf96b8fa1ae2cd81 => 340
	i64 13806364379217932032, ; 590: pt-BR/System.ServiceModel.NetFramingBase.resources.dll => 0xbf9a0f40eee42f00 => 356
	i64 13814445057219246765, ; 591: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 299
	i64 13828521679616088467, ; 592: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 283
	i64 13830070810343648044, ; 593: System.ServiceModel.Http.dll => 0xbfee48208d082b2c => 199
	i64 13874392747353528814, ; 594: it\System.ServiceModel.Federation.resources => 0xc08bbeb1ac4359ee => 326
	i64 13881769479078963060, ; 595: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 596: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 597: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13947035440391415689, ; 598: zh-Hans\System.ServiceModel.Primitives.resources => 0xc18dd2d6a6506789 => 398
	i64 13959074834287824816, ; 599: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 237
	i64 14062537208056738663, ; 600: cs\System.ServiceModel.NetNamedPipe.resources => 0xc3282b158eef7367 => 361
	i64 14075334701871371868, ; 601: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14100563506285742564, ; 602: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 291
	i64 14124974489674258913, ; 603: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 219
	i64 14125464355221830302, ; 604: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14178052285788134900, ; 605: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 206
	i64 14212104595480609394, ; 606: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 607: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 608: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 609: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254202117188122242, ; 610: pl/System.ServiceModel.NetNamedPipe.resources.dll => 0xc5d1194db79e7682 => 368
	i64 14254574811015963973, ; 611: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 612: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 257
	i64 14298246716367104064, ; 613: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 614: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 615: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 616: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 207
	i64 14346402571976470310, ; 617: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14461014870687870182, ; 618: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 619: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 312
	i64 14486659737292545672, ; 620: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 242
	i64 14495724990987328804, ; 621: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 260
	i64 14497605124368440498, ; 622: pt-BR\System.ServiceModel.NetFramingBase.resources => 0xc931d70c8bdd1cb2 => 356
	i64 14522721392235705434, ; 623: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 293
	i64 14551742072151931844, ; 624: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 625: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 626: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14622043554576106986, ; 627: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 628: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 252
	i64 14669215534098758659, ; 629: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 176
	i64 14690985099581930927, ; 630: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 631: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 304
	i64 14741804258040025864, ; 632: es\System.ServiceModel.NetNamedPipe.resources => 0xcc9568de04d11308 => 363
	i64 14744092281598614090, ; 633: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 320
	i64 14750216453141343598, ; 634: ja\System.ServiceModel.Http.resources => 0xccb34bb6d19cad6e => 340
	i64 14792063746108907174, ; 635: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 280
	i64 14792991364388157008, ; 636: es\System.ServiceModel.NetTcp.resources => 0xcd4b4344efc6f650 => 376
	i64 14832630590065248058, ; 637: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14839664071391251657, ; 638: System.ServiceModel.Duplex => 0xcdf113d959670cc9 => 197
	i64 14852515768018889994, ; 639: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 228
	i64 14870951093111881137, ; 640: zh-Hans\System.ServiceModel.NetTcp.resources => 0xce603b3ac123fdb1 => 385
	i64 14889905118082851278, ; 641: GoogleGson.dll => 0xcea391d0969961ce => 173
	i64 14892012299694389861, ; 642: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 321
	i64 14904040806490515477, ; 643: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 288
	i64 14905769933452734130, ; 644: es/System.ServiceModel.NetFramingBase.resources.dll => 0xcedbeec7c325eeb2 => 350
	i64 14912225920358050525, ; 645: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 646: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 647: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 177
	i64 14984936317414011727, ; 648: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 649: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 650: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 231
	i64 15015154896917945444, ; 651: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 652: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15033183115947713165, ; 653: cs\System.ServiceModel.Primitives.resources => 0xd0a098650d76a28d => 387
	i64 15071021337266399595, ; 654: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 655: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 656: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 305
	i64 15115185479366240210, ; 657: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 658: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 659: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 258
	i64 15209599533829826619, ; 660: tr/System.ServiceModel.NetTcp.resources.dll => 0xd3135a312ddfa83b => 384
	i64 15227001540531775957, ; 661: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 175
	i64 15234786388537674379, ; 662: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 663: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 664: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 221
	i64 15279429628684179188, ; 665: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 286
	i64 15299439993936780255, ; 666: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15338463749992804988, ; 667: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370334346939861994, ; 668: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 226
	i64 15391712275433856905, ; 669: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 177
	i64 15403947811736892499, ; 670: tr/System.ServiceModel.Http.resources.dll => 0xd5c5d0ebd13bb453 => 345
	i64 15412490934096474927, ; 671: System.ServiceModel.Federation => 0xd5e42ad87ebfb32f => 198
	i64 15413989682962769581, ; 672: es\System.ServiceModel.Primitives.resources => 0xd5e97df3288826ad => 389
	i64 15472743225642400231, ; 673: zh-Hant\System.ServiceModel.Federation.resources => 0xd6ba39fc513f39e7 => 334
	i64 15512084913707906237, ; 674: pt-BR\System.ServiceModel.Http.resources => 0xd745ff0adf4174bd => 343
	i64 15526743539506359484, ; 675: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 676: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 677: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 678: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 292
	i64 15541854775306130054, ; 679: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 680: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15582737692548360875, ; 681: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 250
	i64 15609085926864131306, ; 682: System.dll => 0xd89e9cf3334914ea => 164
	i64 15614406846227935001, ; 683: ko/System.ServiceModel.NetNamedPipe.resources.dll => 0xd8b1844c47d7ef19 => 367
	i64 15637857104874081957, ; 684: System.ServiceModel.NetNamedPipe => 0xd904d42f18568ea5 => 201
	i64 15661133872274321916, ; 685: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 686: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 292
	i64 15710114879900314733, ; 687: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 688: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 300
	i64 15755368083429170162, ; 689: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 690: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 264
	i64 15783653065526199428, ; 691: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 293
	i64 15796674544955155030, ; 692: zh-Hant/System.ServiceModel.Http.resources.dll => 0xdb390fcde481e256 => 347
	i64 15817206913877585035, ; 693: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15847085070278954535, ; 694: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 695: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 696: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 189
	i64 15934062614519587357, ; 697: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 698: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 699: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15968726545588960902, ; 700: pl/System.ServiceModel.NetFramingBase.resources.dll => 0xdd9c502ff12e3e86 => 355
	i64 15971679995444160383, ; 701: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 702: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16046481083542319511, ; 703: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 181
	i64 16054465462676478687, ; 704: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16114460324092078703, ; 705: Microsoft.IdentityModel.Xml.dll => 0xdfa2104964a26a6f => 188
	i64 16154507427712707110, ; 706: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 707: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16272480664611126357, ; 708: fr\System.ServiceModel.NetFramingBase.resources => 0xe1d376f2fc8efc55 => 351
	i64 16288847719894691167, ; 709: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 306
	i64 16315482530584035869, ; 710: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 711: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 179
	i64 16337011941688632206, ; 712: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 713: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 236
	i64 16423015068819898779, ; 714: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 285
	i64 16454459195343277943, ; 715: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16465012559999924934, ; 716: ko\System.ServiceModel.NetNamedPipe.resources => 0xe47f79b01d23fac6 => 367
	i64 16496768397145114574, ; 717: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16506257789526125213, ; 718: tr/System.ServiceModel.NetFramingBase.resources.dll => 0xe512020173baaa9d => 358
	i64 16571052248489204195, ; 719: es\System.ServiceModel.NetFramingBase.resources => 0xe5f8343909a319e3 => 350
	i64 16589693266713801121, ; 720: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 249
	i64 16621146507174665210, ; 721: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 223
	i64 16649148416072044166, ; 722: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 194
	i64 16677317093839702854, ; 723: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 256
	i64 16702652415771857902, ; 724: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 725: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 726: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 727: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 728: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 729: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16775237837682019207, ; 730: de/System.ServiceModel.NetFramingBase.resources.dll => 0xe8cd9def31ba8b87 => 349
	i64 16822611501064131242, ; 731: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 732: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 733: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 734: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 735: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 736: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 313
	i64 16944803401888012179, ; 737: fr/System.ServiceModel.NetFramingBase.resources.dll => 0xeb2808eaa65d9793 => 351
	i64 16977952268158210142, ; 738: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 739: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 249
	i64 16998075588627545693, ; 740: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 254
	i64 17008137082415910100, ; 741: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17023676497273798524, ; 742: es/System.ServiceModel.Http.resources.dll => 0xec403f94372bbf7c => 337
	i64 17024911836938395553, ; 743: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 212
	i64 17026344819618783825, ; 744: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0xec49ba676cb0a251 => 402
	i64 17031351772568316411, ; 745: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 253
	i64 17031924682156397346, ; 746: pl\System.ServiceModel.Primitives.resources => 0xec5d8d426923d322 => 394
	i64 17037200463775726619, ; 747: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 240
	i64 17062143951396181894, ; 748: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 749: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 320
	i64 17101677393452997189, ; 750: de\System.ServiceModel.Federation.resources => 0xed555cfb14181a45 => 323
	i64 17118171214553292978, ; 751: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17137864900836977098, ; 752: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 186
	i64 17163719922865397202, ; 753: cs/System.ServiceModel.Federation.resources.dll => 0xee31c85522afddd2 => 322
	i64 17187273293601214786, ; 754: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 755: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 756: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17230721278011714856, ; 757: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 758: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 759: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17294651574986203234, ; 760: pl/System.ServiceModel.Http.resources.dll => 0xf002f1f9f933e062 => 342
	i64 17333249706306540043, ; 761: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 762: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 763: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 298
	i64 17360349973592121190, ; 764: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 278
	i64 17367298616515891650, ; 765: fr/System.ServiceModel.Federation.resources.dll => 0xf1050a13699011c2 => 325
	i64 17382160109067067964, ; 766: cs/System.ServiceModel.NetNamedPipe.resources.dll => 0xf139d68649e8623c => 361
	i64 17438153253682247751, ; 767: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 313
	i64 17470386307322966175, ; 768: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 769: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 770: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 296
	i64 17522591619082469157, ; 771: GoogleGson => 0xf32cc03d27a5bf25 => 173
	i64 17556740846514848528, ; 772: zh-Hant/System.ServiceModel.NetTcp.resources.dll => 0xf3a612c7c21bc310 => 386
	i64 17590473451926037903, ; 773: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 205
	i64 17623389608345532001, ; 774: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 308
	i64 17627500474728259406, ; 775: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685511033268820096, ; 776: zh-Hans\System.ServiceModel.NetNamedPipe.resources => 0xf56f8e95393d5880 => 372
	i64 17685921127322830888, ; 777: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 778: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 319
	i64 17704177640604968747, ; 779: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 251
	i64 17710060891934109755, ; 780: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 248
	i64 17712670374920797664, ; 781: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17777860260071588075, ; 782: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17790600151040787804, ; 783: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 184
	i64 17838668724098252521, ; 784: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17871147545075994307, ; 785: cs\System.ServiceModel.NetFramingBase.resources => 0xf8031201c0d94ec3 => 348
	i64 17891337867145587222, ; 786: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 281
	i64 17928294245072900555, ; 787: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17992315986609351877, ; 788: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18025913125965088385, ; 789: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 790: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 307
	i64 18116111925905154859, ; 791: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 217
	i64 18121036031235206392, ; 792: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 253
	i64 18146411883821974900, ; 793: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 794: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 795: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 195
	i64 18225059387460068507, ; 796: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 797: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 798: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 234
	i64 18274843375259426212, ; 799: pt-BR/System.ServiceModel.Http.resources.dll => 0xfd9d4939bc3d1da4 => 343
	i64 18305135509493619199, ; 800: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 255
	i64 18318849532986632368, ; 801: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 802: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 302
	i64 18330954238200775945, ; 803: TaskyAndroid.dll => 0xfe64a1c211e60509 => 0
	i64 18362437444048002214, ; 804: tr\System.ServiceModel.Primitives.resources => 0xfed47b9126d01ca6 => 397
	i64 18380184030268848184, ; 805: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 271
	i64 18428404840311395189, ; 806: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 196
	i64 18439108438687598470 ; 807: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [808 x i32] [
	i32 233, ; 0
	i32 202, ; 1
	i32 371, ; 2
	i32 183, ; 3
	i32 171, ; 4
	i32 193, ; 5
	i32 366, ; 6
	i32 201, ; 7
	i32 389, ; 8
	i32 58, ; 9
	i32 220, ; 10
	i32 151, ; 11
	i32 261, ; 12
	i32 198, ; 13
	i32 264, ; 14
	i32 227, ; 15
	i32 329, ; 16
	i32 132, ; 17
	i32 358, ; 18
	i32 328, ; 19
	i32 402, ; 20
	i32 353, ; 21
	i32 56, ; 22
	i32 263, ; 23
	i32 204, ; 24
	i32 396, ; 25
	i32 181, ; 26
	i32 295, ; 27
	i32 95, ; 28
	i32 399, ; 29
	i32 246, ; 30
	i32 129, ; 31
	i32 0, ; 32
	i32 197, ; 33
	i32 145, ; 34
	i32 221, ; 35
	i32 18, ; 36
	i32 298, ; 37
	i32 232, ; 38
	i32 247, ; 39
	i32 150, ; 40
	i32 104, ; 41
	i32 95, ; 42
	i32 334, ; 43
	i32 366, ; 44
	i32 276, ; 45
	i32 306, ; 46
	i32 383, ; 47
	i32 36, ; 48
	i32 28, ; 49
	i32 216, ; 50
	i32 187, ; 51
	i32 379, ; 52
	i32 254, ; 53
	i32 50, ; 54
	i32 115, ; 55
	i32 346, ; 56
	i32 70, ; 57
	i32 190, ; 58
	i32 65, ; 59
	i32 170, ; 60
	i32 145, ; 61
	i32 304, ; 62
	i32 275, ; 63
	i32 393, ; 64
	i32 215, ; 65
	i32 250, ; 66
	i32 240, ; 67
	i32 40, ; 68
	i32 89, ; 69
	i32 345, ; 70
	i32 81, ; 71
	i32 66, ; 72
	i32 62, ; 73
	i32 325, ; 74
	i32 86, ; 75
	i32 214, ; 76
	i32 373, ; 77
	i32 106, ; 78
	i32 294, ; 79
	i32 261, ; 80
	i32 399, ; 81
	i32 102, ; 82
	i32 35, ; 83
	i32 211, ; 84
	i32 316, ; 85
	i32 263, ; 86
	i32 191, ; 87
	i32 316, ; 88
	i32 119, ; 89
	i32 331, ; 90
	i32 248, ; 91
	i32 290, ; 92
	i32 308, ; 93
	i32 142, ; 94
	i32 383, ; 95
	i32 141, ; 96
	i32 284, ; 97
	i32 53, ; 98
	i32 35, ; 99
	i32 141, ; 100
	i32 208, ; 101
	i32 218, ; 102
	i32 362, ; 103
	i32 378, ; 104
	i32 180, ; 105
	i32 232, ; 106
	i32 396, ; 107
	i32 8, ; 108
	i32 14, ; 109
	i32 312, ; 110
	i32 260, ; 111
	i32 349, ; 112
	i32 51, ; 113
	i32 243, ; 114
	i32 342, ; 115
	i32 136, ; 116
	i32 101, ; 117
	i32 225, ; 118
	i32 270, ; 119
	i32 116, ; 120
	i32 209, ; 121
	i32 163, ; 122
	i32 315, ; 123
	i32 186, ; 124
	i32 166, ; 125
	i32 67, ; 126
	i32 176, ; 127
	i32 290, ; 128
	i32 373, ; 129
	i32 80, ; 130
	i32 379, ; 131
	i32 101, ; 132
	i32 265, ; 133
	i32 117, ; 134
	i32 295, ; 135
	i32 277, ; 136
	i32 78, ; 137
	i32 276, ; 138
	i32 401, ; 139
	i32 347, ; 140
	i32 352, ; 141
	i32 114, ; 142
	i32 121, ; 143
	i32 48, ; 144
	i32 394, ; 145
	i32 128, ; 146
	i32 362, ; 147
	i32 241, ; 148
	i32 212, ; 149
	i32 82, ; 150
	i32 110, ; 151
	i32 327, ; 152
	i32 75, ; 153
	i32 287, ; 154
	i32 193, ; 155
	i32 53, ; 156
	i32 267, ; 157
	i32 174, ; 158
	i32 69, ; 159
	i32 266, ; 160
	i32 83, ; 161
	i32 172, ; 162
	i32 380, ; 163
	i32 355, ; 164
	i32 310, ; 165
	i32 116, ; 166
	i32 175, ; 167
	i32 156, ; 168
	i32 174, ; 169
	i32 185, ; 170
	i32 206, ; 171
	i32 329, ; 172
	i32 167, ; 173
	i32 365, ; 174
	i32 259, ; 175
	i32 233, ; 176
	i32 338, ; 177
	i32 178, ; 178
	i32 32, ; 179
	i32 191, ; 180
	i32 122, ; 181
	i32 72, ; 182
	i32 333, ; 183
	i32 62, ; 184
	i32 161, ; 185
	i32 113, ; 186
	i32 88, ; 187
	i32 189, ; 188
	i32 341, ; 189
	i32 321, ; 190
	i32 105, ; 191
	i32 18, ; 192
	i32 146, ; 193
	i32 118, ; 194
	i32 58, ; 195
	i32 227, ; 196
	i32 17, ; 197
	i32 390, ; 198
	i32 332, ; 199
	i32 52, ; 200
	i32 92, ; 201
	i32 401, ; 202
	i32 344, ; 203
	i32 335, ; 204
	i32 318, ; 205
	i32 365, ; 206
	i32 55, ; 207
	i32 400, ; 208
	i32 129, ; 209
	i32 392, ; 210
	i32 381, ; 211
	i32 152, ; 212
	i32 41, ; 213
	i32 92, ; 214
	i32 352, ; 215
	i32 395, ; 216
	i32 271, ; 217
	i32 50, ; 218
	i32 288, ; 219
	i32 162, ; 220
	i32 13, ; 221
	i32 245, ; 222
	i32 209, ; 223
	i32 266, ; 224
	i32 36, ; 225
	i32 67, ; 226
	i32 109, ; 227
	i32 210, ; 228
	i32 392, ; 229
	i32 99, ; 230
	i32 326, ; 231
	i32 99, ; 232
	i32 11, ; 233
	i32 344, ; 234
	i32 11, ; 235
	i32 252, ; 236
	i32 25, ; 237
	i32 128, ; 238
	i32 76, ; 239
	i32 244, ; 240
	i32 109, ; 241
	i32 377, ; 242
	i32 354, ; 243
	i32 270, ; 244
	i32 268, ; 245
	i32 106, ; 246
	i32 2, ; 247
	i32 388, ; 248
	i32 26, ; 249
	i32 223, ; 250
	i32 157, ; 251
	i32 314, ; 252
	i32 21, ; 253
	i32 317, ; 254
	i32 49, ; 255
	i32 43, ; 256
	i32 126, ; 257
	i32 213, ; 258
	i32 59, ; 259
	i32 119, ; 260
	i32 204, ; 261
	i32 273, ; 262
	i32 236, ; 263
	i32 222, ; 264
	i32 3, ; 265
	i32 390, ; 266
	i32 370, ; 267
	i32 393, ; 268
	i32 242, ; 269
	i32 384, ; 270
	i32 322, ; 271
	i32 262, ; 272
	i32 382, ; 273
	i32 38, ; 274
	i32 124, ; 275
	i32 311, ; 276
	i32 262, ; 277
	i32 377, ; 278
	i32 311, ; 279
	i32 137, ; 280
	i32 149, ; 281
	i32 85, ; 282
	i32 90, ; 283
	i32 354, ; 284
	i32 246, ; 285
	i32 403, ; 286
	i32 327, ; 287
	i32 243, ; 288
	i32 324, ; 289
	i32 299, ; 290
	i32 218, ; 291
	i32 341, ; 292
	i32 229, ; 293
	i32 274, ; 294
	i32 182, ; 295
	i32 279, ; 296
	i32 244, ; 297
	i32 133, ; 298
	i32 371, ; 299
	i32 96, ; 300
	i32 3, ; 301
	i32 307, ; 302
	i32 339, ; 303
	i32 105, ; 304
	i32 310, ; 305
	i32 33, ; 306
	i32 154, ; 307
	i32 158, ; 308
	i32 323, ; 309
	i32 155, ; 310
	i32 82, ; 311
	i32 374, ; 312
	i32 238, ; 313
	i32 330, ; 314
	i32 196, ; 315
	i32 143, ; 316
	i32 87, ; 317
	i32 369, ; 318
	i32 19, ; 319
	i32 239, ; 320
	i32 195, ; 321
	i32 51, ; 322
	i32 208, ; 323
	i32 360, ; 324
	i32 314, ; 325
	i32 61, ; 326
	i32 54, ; 327
	i32 4, ; 328
	i32 97, ; 329
	i32 374, ; 330
	i32 207, ; 331
	i32 370, ; 332
	i32 17, ; 333
	i32 359, ; 334
	i32 388, ; 335
	i32 155, ; 336
	i32 84, ; 337
	i32 368, ; 338
	i32 29, ; 339
	i32 45, ; 340
	i32 64, ; 341
	i32 66, ; 342
	i32 305, ; 343
	i32 172, ; 344
	i32 247, ; 345
	i32 1, ; 346
	i32 282, ; 347
	i32 47, ; 348
	i32 24, ; 349
	i32 215, ; 350
	i32 165, ; 351
	i32 108, ; 352
	i32 357, ; 353
	i32 12, ; 354
	i32 241, ; 355
	i32 63, ; 356
	i32 27, ; 357
	i32 23, ; 358
	i32 93, ; 359
	i32 369, ; 360
	i32 168, ; 361
	i32 346, ; 362
	i32 12, ; 363
	i32 357, ; 364
	i32 286, ; 365
	i32 194, ; 366
	i32 331, ; 367
	i32 29, ; 368
	i32 103, ; 369
	i32 14, ; 370
	i32 126, ; 371
	i32 224, ; 372
	i32 256, ; 373
	i32 91, ; 374
	i32 372, ; 375
	i32 245, ; 376
	i32 382, ; 377
	i32 9, ; 378
	i32 339, ; 379
	i32 86, ; 380
	i32 235, ; 381
	i32 268, ; 382
	i32 309, ; 383
	i32 71, ; 384
	i32 168, ; 385
	i32 1, ; 386
	i32 255, ; 387
	i32 5, ; 388
	i32 348, ; 389
	i32 309, ; 390
	i32 44, ; 391
	i32 27, ; 392
	i32 187, ; 393
	i32 360, ; 394
	i32 378, ; 395
	i32 283, ; 396
	i32 398, ; 397
	i32 158, ; 398
	i32 258, ; 399
	i32 112, ; 400
	i32 397, ; 401
	i32 375, ; 402
	i32 319, ; 403
	i32 121, ; 404
	i32 381, ; 405
	i32 337, ; 406
	i32 273, ; 407
	i32 364, ; 408
	i32 214, ; 409
	i32 184, ; 410
	i32 359, ; 411
	i32 159, ; 412
	i32 335, ; 413
	i32 131, ; 414
	i32 278, ; 415
	i32 57, ; 416
	i32 138, ; 417
	i32 83, ; 418
	i32 30, ; 419
	i32 225, ; 420
	i32 10, ; 421
	i32 391, ; 422
	i32 324, ; 423
	i32 275, ; 424
	i32 171, ; 425
	i32 222, ; 426
	i32 150, ; 427
	i32 94, ; 428
	i32 235, ; 429
	i32 330, ; 430
	i32 60, ; 431
	i32 192, ; 432
	i32 157, ; 433
	i32 294, ; 434
	i32 180, ; 435
	i32 64, ; 436
	i32 88, ; 437
	i32 338, ; 438
	i32 79, ; 439
	i32 47, ; 440
	i32 190, ; 441
	i32 203, ; 442
	i32 143, ; 443
	i32 291, ; 444
	i32 328, ; 445
	i32 284, ; 446
	i32 229, ; 447
	i32 74, ; 448
	i32 91, ; 449
	i32 400, ; 450
	i32 281, ; 451
	i32 135, ; 452
	i32 90, ; 453
	i32 267, ; 454
	i32 287, ; 455
	i32 226, ; 456
	i32 391, ; 457
	i32 289, ; 458
	i32 112, ; 459
	i32 42, ; 460
	i32 159, ; 461
	i32 4, ; 462
	i32 103, ; 463
	i32 200, ; 464
	i32 70, ; 465
	i32 60, ; 466
	i32 39, ; 467
	i32 216, ; 468
	i32 153, ; 469
	i32 56, ; 470
	i32 34, ; 471
	i32 179, ; 472
	i32 192, ; 473
	i32 188, ; 474
	i32 213, ; 475
	i32 21, ; 476
	i32 163, ; 477
	i32 279, ; 478
	i32 300, ; 479
	i32 277, ; 480
	i32 202, ; 481
	i32 272, ; 482
	i32 376, ; 483
	i32 140, ; 484
	i32 387, ; 485
	i32 303, ; 486
	i32 182, ; 487
	i32 89, ; 488
	i32 333, ; 489
	i32 147, ; 490
	i32 228, ; 491
	i32 162, ; 492
	i32 257, ; 493
	i32 6, ; 494
	i32 169, ; 495
	i32 31, ; 496
	i32 107, ; 497
	i32 199, ; 498
	i32 238, ; 499
	i32 301, ; 500
	i32 272, ; 501
	i32 178, ; 502
	i32 211, ; 503
	i32 265, ; 504
	i32 167, ; 505
	i32 239, ; 506
	i32 140, ; 507
	i32 297, ; 508
	i32 59, ; 509
	i32 144, ; 510
	i32 386, ; 511
	i32 81, ; 512
	i32 74, ; 513
	i32 130, ; 514
	i32 336, ; 515
	i32 25, ; 516
	i32 7, ; 517
	i32 93, ; 518
	i32 269, ; 519
	i32 137, ; 520
	i32 200, ; 521
	i32 353, ; 522
	i32 205, ; 523
	i32 113, ; 524
	i32 9, ; 525
	i32 104, ; 526
	i32 203, ; 527
	i32 19, ; 528
	i32 237, ; 529
	i32 385, ; 530
	i32 251, ; 531
	i32 403, ; 532
	i32 231, ; 533
	i32 33, ; 534
	i32 219, ; 535
	i32 46, ; 536
	i32 336, ; 537
	i32 364, ; 538
	i32 302, ; 539
	i32 363, ; 540
	i32 30, ; 541
	i32 220, ; 542
	i32 57, ; 543
	i32 134, ; 544
	i32 114, ; 545
	i32 274, ; 546
	i32 315, ; 547
	i32 285, ; 548
	i32 55, ; 549
	i32 183, ; 550
	i32 6, ; 551
	i32 77, ; 552
	i32 375, ; 553
	i32 230, ; 554
	i32 380, ; 555
	i32 111, ; 556
	i32 185, ; 557
	i32 234, ; 558
	i32 102, ; 559
	i32 289, ; 560
	i32 303, ; 561
	i32 332, ; 562
	i32 170, ; 563
	i32 115, ; 564
	i32 297, ; 565
	i32 269, ; 566
	i32 224, ; 567
	i32 76, ; 568
	i32 395, ; 569
	i32 280, ; 570
	i32 85, ; 571
	i32 282, ; 572
	i32 317, ; 573
	i32 217, ; 574
	i32 318, ; 575
	i32 301, ; 576
	i32 259, ; 577
	i32 160, ; 578
	i32 2, ; 579
	i32 230, ; 580
	i32 24, ; 581
	i32 210, ; 582
	i32 32, ; 583
	i32 117, ; 584
	i32 37, ; 585
	i32 16, ; 586
	i32 296, ; 587
	i32 52, ; 588
	i32 340, ; 589
	i32 356, ; 590
	i32 299, ; 591
	i32 283, ; 592
	i32 199, ; 593
	i32 326, ; 594
	i32 20, ; 595
	i32 123, ; 596
	i32 154, ; 597
	i32 398, ; 598
	i32 237, ; 599
	i32 361, ; 600
	i32 131, ; 601
	i32 291, ; 602
	i32 219, ; 603
	i32 148, ; 604
	i32 206, ; 605
	i32 120, ; 606
	i32 28, ; 607
	i32 132, ; 608
	i32 100, ; 609
	i32 368, ; 610
	i32 134, ; 611
	i32 257, ; 612
	i32 153, ; 613
	i32 97, ; 614
	i32 125, ; 615
	i32 207, ; 616
	i32 69, ; 617
	i32 72, ; 618
	i32 312, ; 619
	i32 242, ; 620
	i32 260, ; 621
	i32 356, ; 622
	i32 293, ; 623
	i32 136, ; 624
	i32 124, ; 625
	i32 71, ; 626
	i32 111, ; 627
	i32 252, ; 628
	i32 176, ; 629
	i32 152, ; 630
	i32 304, ; 631
	i32 363, ; 632
	i32 320, ; 633
	i32 340, ; 634
	i32 280, ; 635
	i32 376, ; 636
	i32 118, ; 637
	i32 197, ; 638
	i32 228, ; 639
	i32 385, ; 640
	i32 173, ; 641
	i32 321, ; 642
	i32 288, ; 643
	i32 350, ; 644
	i32 127, ; 645
	i32 133, ; 646
	i32 177, ; 647
	i32 77, ; 648
	i32 46, ; 649
	i32 231, ; 650
	i32 73, ; 651
	i32 63, ; 652
	i32 387, ; 653
	i32 98, ; 654
	i32 84, ; 655
	i32 305, ; 656
	i32 43, ; 657
	i32 61, ; 658
	i32 258, ; 659
	i32 384, ; 660
	i32 175, ; 661
	i32 37, ; 662
	i32 40, ; 663
	i32 221, ; 664
	i32 286, ; 665
	i32 160, ; 666
	i32 98, ; 667
	i32 226, ; 668
	i32 177, ; 669
	i32 345, ; 670
	i32 198, ; 671
	i32 389, ; 672
	i32 334, ; 673
	i32 343, ; 674
	i32 135, ; 675
	i32 20, ; 676
	i32 65, ; 677
	i32 292, ; 678
	i32 125, ; 679
	i32 75, ; 680
	i32 250, ; 681
	i32 164, ; 682
	i32 367, ; 683
	i32 201, ; 684
	i32 156, ; 685
	i32 292, ; 686
	i32 5, ; 687
	i32 300, ; 688
	i32 49, ; 689
	i32 264, ; 690
	i32 293, ; 691
	i32 347, ; 692
	i32 144, ; 693
	i32 139, ; 694
	i32 100, ; 695
	i32 189, ; 696
	i32 123, ; 697
	i32 120, ; 698
	i32 142, ; 699
	i32 355, ; 700
	i32 39, ; 701
	i32 68, ; 702
	i32 181, ; 703
	i32 41, ; 704
	i32 188, ; 705
	i32 164, ; 706
	i32 73, ; 707
	i32 351, ; 708
	i32 306, ; 709
	i32 165, ; 710
	i32 179, ; 711
	i32 127, ; 712
	i32 236, ; 713
	i32 285, ; 714
	i32 68, ; 715
	i32 367, ; 716
	i32 169, ; 717
	i32 358, ; 718
	i32 350, ; 719
	i32 249, ; 720
	i32 223, ; 721
	i32 194, ; 722
	i32 256, ; 723
	i32 151, ; 724
	i32 45, ; 725
	i32 108, ; 726
	i32 48, ; 727
	i32 96, ; 728
	i32 31, ; 729
	i32 349, ; 730
	i32 23, ; 731
	i32 166, ; 732
	i32 22, ; 733
	i32 138, ; 734
	i32 78, ; 735
	i32 313, ; 736
	i32 351, ; 737
	i32 54, ; 738
	i32 249, ; 739
	i32 254, ; 740
	i32 10, ; 741
	i32 337, ; 742
	i32 212, ; 743
	i32 402, ; 744
	i32 253, ; 745
	i32 394, ; 746
	i32 240, ; 747
	i32 16, ; 748
	i32 320, ; 749
	i32 323, ; 750
	i32 139, ; 751
	i32 186, ; 752
	i32 322, ; 753
	i32 13, ; 754
	i32 15, ; 755
	i32 122, ; 756
	i32 87, ; 757
	i32 149, ; 758
	i32 22, ; 759
	i32 342, ; 760
	i32 34, ; 761
	i32 79, ; 762
	i32 298, ; 763
	i32 278, ; 764
	i32 325, ; 765
	i32 361, ; 766
	i32 313, ; 767
	i32 147, ; 768
	i32 80, ; 769
	i32 296, ; 770
	i32 173, ; 771
	i32 386, ; 772
	i32 205, ; 773
	i32 308, ; 774
	i32 42, ; 775
	i32 372, ; 776
	i32 26, ; 777
	i32 319, ; 778
	i32 251, ; 779
	i32 248, ; 780
	i32 107, ; 781
	i32 110, ; 782
	i32 184, ; 783
	i32 7, ; 784
	i32 348, ; 785
	i32 281, ; 786
	i32 44, ; 787
	i32 161, ; 788
	i32 148, ; 789
	i32 307, ; 790
	i32 217, ; 791
	i32 253, ; 792
	i32 38, ; 793
	i32 15, ; 794
	i32 195, ; 795
	i32 146, ; 796
	i32 8, ; 797
	i32 234, ; 798
	i32 343, ; 799
	i32 255, ; 800
	i32 130, ; 801
	i32 302, ; 802
	i32 0, ; 803
	i32 397, ; 804
	i32 271, ; 805
	i32 196, ; 806
	i32 94 ; 807
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
