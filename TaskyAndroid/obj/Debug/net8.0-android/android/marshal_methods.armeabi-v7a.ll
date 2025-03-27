; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [410 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [814 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 3921707, ; 1: fr\System.ServiceModel.NetFramingBase.resources => 0x3bd72b => 354
	i32 10166715, ; 2: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 3: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 17613696, ; 4: es\System.ServiceModel.NetTcp.resources => 0x10cc380 => 379
	i32 28923068, ; 5: tr\System.ServiceModel.Federation.resources => 0x1b954bc => 335
	i32 32687329, ; 6: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 249
	i32 34715100, ; 7: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 283
	i32 34839235, ; 8: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 53472207, ; 11: System.ServiceModel.Duplex.dll => 0x32febcf => 204
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 13: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 324
	i32 68219467, ; 14: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 71084978, ; 15: cs\System.ServiceModel.NetNamedPipe.resources => 0x43cabb2 => 364
	i32 72070932, ; 16: Microsoft.Maui.Graphics.dll => 0x44bb714 => 196
	i32 82292897, ; 17: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 85813540, ; 18: ja/System.ServiceModel.Primitives.resources.dll => 0x51d6924 => 395
	i32 101534019, ; 19: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 267
	i32 117431740, ; 20: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 21: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 267
	i32 122350210, ; 22: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 23: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 287
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 223
	i32 166617380, ; 28: de/System.ServiceModel.NetFramingBase.resources.dll => 0x9ee6124 => 352
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 269
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 192921502, ; 32: fr\System.ServiceModel.Http.resources => 0xb7fbf9e => 341
	i32 193868653, ; 33: de\System.ServiceModel.NetNamedPipe.resources => 0xb8e336d => 365
	i32 195452805, ; 34: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 321
	i32 199333315, ; 35: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 322
	i32 205061960, ; 36: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 37: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 221
	i32 209580789, ; 38: ko\System.ServiceModel.Federation.resources => 0xc7df2f5 => 331
	i32 220171995, ; 39: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 40: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 243
	i32 230752869, ; 41: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 230884747, ; 42: ru/System.ServiceModel.Primitives.resources.dll => 0xdc3058b => 399
	i32 231409092, ; 43: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 44: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 45: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 247181326, ; 46: es/System.ServiceModel.NetNamedPipe.resources.dll => 0xebbb00e => 366
	i32 261689757, ; 47: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 226
	i32 276479776, ; 48: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 49: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 245
	i32 280482487, ; 50: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 242
	i32 280992041, ; 51: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 293
	i32 285314186, ; 52: it\System.ServiceModel.Primitives.resources => 0x11018c8a => 394
	i32 291076382, ; 53: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 296834212, ; 54: zh-Hans\System.ServiceModel.Http.resources => 0x11b154a4 => 349
	i32 298918909, ; 55: System.Net.Ping.dll => 0x11d123fd => 69
	i32 316078633, ; 56: pl\System.ServiceModel.Http.resources => 0x12d6fa29 => 345
	i32 317674968, ; 57: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 321
	i32 318968648, ; 58: Xamarin.AndroidX.Activity.dll => 0x13031348 => 212
	i32 320721186, ; 59: ko/System.ServiceModel.NetTcp.resources.dll => 0x131dd122 => 383
	i32 321597661, ; 60: System.Numerics => 0x132b30dd => 83
	i32 324831035, ; 61: ja/System.ServiceModel.NetFramingBase.resources.dll => 0x135c873b => 356
	i32 336156722, ; 62: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 306
	i32 342366114, ; 63: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 244
	i32 356389973, ; 64: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 305
	i32 360082299, ; 65: System.ServiceModel.Web => 0x15766b7b => 131
	i32 361065771, ; 66: cs/System.ServiceModel.NetTcp.resources.dll => 0x15856d2b => 377
	i32 367780167, ; 67: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 68: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 69: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 70: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 71: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 72: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 73: _Microsoft.Android.Resource.Designer => 0x17969339 => 406
	i32 403441872, ; 74: WindowsBase => 0x180c08d0 => 165
	i32 420389340, ; 75: es\System.ServiceModel.NetNamedPipe.resources => 0x190ea1dc => 366
	i32 435591531, ; 76: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 317
	i32 441335492, ; 77: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 227
	i32 442565967, ; 78: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 79: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 240
	i32 451504562, ; 80: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456096849, ; 81: zh-Hans/System.ServiceModel.Primitives.resources.dll => 0x1b2f7c51 => 401
	i32 456227837, ; 82: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 83: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 84: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 85: System.dll => 0x1bff388e => 164
	i32 470570628, ; 86: TaskyAndroid.dll => 0x1c0c5684 => 0
	i32 476646585, ; 87: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 242
	i32 482736244, ; 88: fr/System.ServiceModel.NetNamedPipe.resources.dll => 0x1cc5f874 => 367
	i32 486930444, ; 89: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 255
	i32 498788369, ; 90: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 91: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 304
	i32 500534657, ; 92: tr/System.ServiceModel.Http.resources.dll => 0x1dd58d81 => 348
	i32 503918385, ; 93: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 298
	i32 513247710, ; 94: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 520748051, ; 95: ja\System.ServiceModel.NetTcp.resources => 0x1f09fc13 => 382
	i32 525250519, ; 96: de/System.ServiceModel.NetTcp.resources.dll => 0x1f4eafd7 => 378
	i32 526420162, ; 97: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 98: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 287
	i32 530272170, ; 99: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 531014212, ; 100: ja\System.ServiceModel.Primitives.resources => 0x1fa6a244 => 395
	i32 535122277, ; 101: tr/System.ServiceModel.NetNamedPipe.resources.dll => 0x1fe55165 => 374
	i32 539058512, ; 102: Microsoft.Extensions.Logging => 0x20216150 => 180
	i32 540030774, ; 103: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 104: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 105: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 106: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 107: Jsr305Binding => 0x213954e7 => 280
	i32 562488221, ; 108: System.ServiceModel => 0x2186e39d => 207
	i32 569334933, ; 109: tr/System.ServiceModel.Federation.resources.dll => 0x21ef5c95 => 335
	i32 569601784, ; 110: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 278
	i32 577335427, ; 111: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 580569086, ; 112: zh-Hans\System.ServiceModel.NetTcp.resources => 0x229ac7fe => 388
	i32 592146354, ; 113: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 312
	i32 597488923, ; 114: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 115: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 116: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 117: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 625044127, ; 118: es/System.ServiceModel.NetTcp.resources.dll => 0x25416a9f => 379
	i32 627609679, ; 119: Xamarin.AndroidX.CustomView => 0x2568904f => 232
	i32 627931235, ; 120: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 310
	i32 634015394, ; 121: tr\System.ServiceModel.Primitives.resources => 0x25ca4ea2 => 400
	i32 635078218, ; 122: de\System.ServiceModel.Primitives.resources => 0x25da864a => 391
	i32 639843206, ; 123: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 238
	i32 643868501, ; 124: System.Net => 0x2660a755 => 81
	i32 643983915, ; 125: System.ServiceModel.Security => 0x26626a2b => 206
	i32 648503046, ; 126: de\System.ServiceModel.Federation.resources => 0x26a75f06 => 326
	i32 662205335, ; 127: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 128: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 274
	i32 666292255, ; 129: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 219
	i32 672442732, ; 130: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 131: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 132: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 292
	i32 690569205, ; 133: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 134: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 289
	i32 693804605, ; 135: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 136: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700069175, ; 137: cs/System.ServiceModel.NetNamedPipe.resources.dll => 0x29ba3537 => 364
	i32 700284507, ; 138: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 284
	i32 700358131, ; 139: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 140: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 307
	i32 709152836, ; 141: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 197
	i32 709557578, ; 142: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 295
	i32 710880553, ; 143: fr/System.ServiceModel.Primitives.resources.dll => 0x2a5f2d29 => 393
	i32 720511267, ; 144: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 288
	i32 722857257, ; 145: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 146: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 147: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 148: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 209
	i32 759454413, ; 149: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 150: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 767064363, ; 151: it/System.ServiceModel.NetNamedPipe.resources.dll => 0x2db8792b => 368
	i32 775507847, ; 152: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 153: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 316
	i32 789151979, ; 154: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 155: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 233
	i32 804715423, ; 156: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 157: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 247
	i32 823281589, ; 158: System.Private.Uri.dll => 0x311247b5 => 86
	i32 823444754, ; 159: zh-Hant\System.ServiceModel.Http.resources => 0x3114c512 => 350
	i32 828535308, ; 160: System.ServiceModel.NetNamedPipe => 0x3162720c => 202
	i32 830298997, ; 161: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 162: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 163: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 164: Xamarin.AndroidX.Print => 0x3246f6cd => 260
	i32 852919649, ; 165: pt-BR/System.ServiceModel.Primitives.resources.dll => 0x32d68561 => 398
	i32 873119928, ; 166: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 167: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 168: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 169: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 170: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 171: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 319
	i32 928116545, ; 172: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 283
	i32 952186615, ; 173: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 174: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 288
	i32 959135198, ; 175: fr/System.ServiceModel.NetFramingBase.resources.dll => 0x392b3dde => 354
	i32 966729478, ; 176: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 281
	i32 967690846, ; 177: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 244
	i32 972805734, ; 178: System.ServiceModel.Http => 0x39fbd666 => 200
	i32 975236339, ; 179: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 180: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 980852653, ; 181: pl\System.ServiceModel.Federation.resources => 0x3a769fad => 332
	i32 986514023, ; 182: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 183: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 184: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 185: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 186: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 187: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 264
	i32 1019214401, ; 188: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 189: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 179
	i32 1029334545, ; 190: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 294
	i32 1031528504, ; 191: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 282
	i32 1033084130, ; 192: cs/System.ServiceModel.NetFramingBase.resources.dll => 0x3d939ce2 => 351
	i32 1035644815, ; 193: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 217
	i32 1036536393, ; 194: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 195: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1047490775, ; 196: ru/System.ServiceModel.Http.resources.dll => 0x3e6f70d7 => 347
	i32 1052210849, ; 197: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 251
	i32 1067306892, ; 198: GoogleGson => 0x3f9dcf8c => 175
	i32 1081414353, ; 199: System.ServiceModel.Http.dll => 0x407512d1 => 200
	i32 1082857460, ; 200: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 201: Xamarin.Kotlin.StdLib => 0x409e66d8 => 285
	i32 1095172895, ; 202: it/System.ServiceModel.NetTcp.resources.dll => 0x4147031f => 381
	i32 1098259244, ; 203: System => 0x41761b2c => 164
	i32 1117830343, ; 204: ru/System.ServiceModel.Federation.resources.dll => 0x42a0bcc7 => 334
	i32 1118262833, ; 205: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 307
	i32 1121599056, ; 206: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 250
	i32 1127624469, ; 207: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 182
	i32 1131748925, ; 208: ru\System.ServiceModel.Http.resources => 0x43751e3d => 347
	i32 1137475283, ; 209: fr\System.ServiceModel.Federation.resources => 0x43cc7ed3 => 328
	i32 1142243660, ; 210: zh-Hant/System.ServiceModel.Http.resources.dll => 0x4415414c => 350
	i32 1149092582, ; 211: Xamarin.AndroidX.Window => 0x447dc2e6 => 277
	i32 1168523401, ; 212: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 313
	i32 1170634674, ; 213: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 214: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 273
	i32 1178241025, ; 215: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 258
	i32 1203215381, ; 216: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 311
	i32 1204270330, ; 217: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 219
	i32 1205230995, ; 218: it/System.ServiceModel.Http.resources.dll => 0x47d65d93 => 342
	i32 1207862497, ; 219: System.ServiceModel.NetTcp.dll => 0x47fe84e1 => 203
	i32 1208641965, ; 220: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 221: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 222: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 309
	i32 1243150071, ; 223: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 278
	i32 1253011324, ; 224: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 225: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 293
	i32 1264511973, ; 226: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 268
	i32 1267360935, ; 227: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 272
	i32 1273260888, ; 228: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 224
	i32 1275534314, ; 229: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 289
	i32 1278448581, ; 230: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 216
	i32 1293217323, ; 231: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 235
	i32 1296184643, ; 232: pl\System.ServiceModel.NetFramingBase.resources => 0x4d423543 => 358
	i32 1307310235, ; 233: pl/System.ServiceModel.Http.resources.dll => 0x4debf89b => 345
	i32 1309188875, ; 234: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1314523075, ; 235: fr/System.ServiceModel.NetTcp.resources.dll => 0x4e5a07c3 => 380
	i32 1322716291, ; 236: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 277
	i32 1324164729, ; 237: System.Linq => 0x4eed2679 => 61
	i32 1324212547, ; 238: pt-BR\System.ServiceModel.NetTcp.resources => 0x4eede143 => 385
	i32 1335329327, ; 239: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1360479413, ; 240: it\System.ServiceModel.Federation.resources => 0x511744b5 => 329
	i32 1361525254, ; 241: ru\System.ServiceModel.NetNamedPipe.resources => 0x51273a06 => 373
	i32 1364015309, ; 242: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 243: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 323
	i32 1376866003, ; 244: Xamarin.AndroidX.SavedState => 0x52114ed3 => 264
	i32 1379779777, ; 245: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1394641819, ; 246: System.ServiceModel.Primitives => 0x53208b9b => 205
	i32 1397695725, ; 247: Microsoft.IdentityModel.Xml => 0x534f24ed => 190
	i32 1402170036, ; 248: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 249: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 228
	i32 1408764838, ; 250: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 251: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 252: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1423907884, ; 253: zh-Hant/System.ServiceModel.Primitives.resources.dll => 0x54df1c2c => 402
	i32 1430672901, ; 254: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 291
	i32 1430830959, ; 255: zh-Hant\System.ServiceModel.NetFramingBase.resources => 0x5548bf6f => 363
	i32 1434145427, ; 256: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 257: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 281
	i32 1439761251, ; 258: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1442844750, ; 259: cs/System.ServiceModel.Primitives.resources.dll => 0x5600104e => 390
	i32 1452070440, ; 260: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 261: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 262: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 263: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 264: es\Microsoft.Maui.Controls.resources => 0x57152abe => 297
	i32 1461234159, ; 265: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 266: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 267: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 268: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 218
	i32 1470490898, ; 269: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1479771757, ; 270: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 271: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 272: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 273: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 265
	i32 1493001747, ; 274: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 301
	i32 1496356098, ; 275: pt-BR\System.ServiceModel.NetFramingBase.resources => 0x59309502 => 359
	i32 1514721132, ; 276: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 296
	i32 1536373174, ; 277: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 278: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 279: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 280: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 281: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 316
	i32 1552155078, ; 282: System.ServiceModel.NetFramingBase => 0x5c8401c6 => 201
	i32 1565862583, ; 283: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 284: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 285: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 286: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 287: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 234
	i32 1590860858, ; 288: System.ServiceModel.NetTcp => 0x5ed29c3a => 203
	i32 1592978981, ; 289: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 290: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 282
	i32 1601112923, ; 291: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 292: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 403
	i32 1604827217, ; 293: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 294: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 295: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 254
	i32 1622358360, ; 296: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 297: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 276
	i32 1626255391, ; 298: Microsoft.IdentityModel.Protocols.WsTrust => 0x60eeb01f => 187
	i32 1628529952, ; 299: pt-BR/System.ServiceModel.Http.resources.dll => 0x61116520 => 346
	i32 1629788937, ; 300: cs\System.ServiceModel.Primitives.resources => 0x61249b09 => 390
	i32 1634654947, ; 301: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 302: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 238
	i32 1636350590, ; 303: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 231
	i32 1639515021, ; 304: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 305: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 306: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1656530436, ; 307: ja/System.ServiceModel.NetNamedPipe.resources.dll => 0x62bca604 => 369
	i32 1657153582, ; 308: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 309: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 270
	i32 1658251792, ; 310: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 279
	i32 1661950287, ; 311: ru/System.ServiceModel.NetNamedPipe.resources.dll => 0x630f594f => 373
	i32 1670060433, ; 312: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 226
	i32 1675553242, ; 313: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 314: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 315: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 316: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 317: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 318: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 319: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 286
	i32 1701541528, ; 320: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1717748983, ; 321: ko/System.ServiceModel.Federation.resources.dll => 0x6662c4f7 => 331
	i32 1720223769, ; 322: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 247
	i32 1726116996, ; 323: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 324: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 325: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 222
	i32 1736233607, ; 326: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 314
	i32 1743415430, ; 327: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 292
	i32 1744735666, ; 328: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 329: Mono.Android.Export => 0x6816ab6a => 169
	i32 1749969296, ; 330: it/System.ServiceModel.Federation.resources.dll => 0x684e6990 => 329
	i32 1750313021, ; 331: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 332: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 333: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 334: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 335: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 269
	i32 1770582343, ; 336: Microsoft.Extensions.Logging.dll => 0x6988f147 => 180
	i32 1775568156, ; 337: de/System.ServiceModel.Primitives.resources.dll => 0x69d5051c => 391
	i32 1776026572, ; 338: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 339: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 340: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 341: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 308
	i32 1787719884, ; 342: tr/System.ServiceModel.NetFramingBase.resources.dll => 0x6a8e70cc => 361
	i32 1788241197, ; 343: Xamarin.AndroidX.Fragment => 0x6a96652d => 240
	i32 1792213857, ; 344: ru\System.ServiceModel.Federation.resources => 0x6ad30361 => 334
	i32 1793755602, ; 345: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 300
	i32 1808609942, ; 346: Xamarin.AndroidX.Loader => 0x6bcd3296 => 254
	i32 1813058853, ; 347: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 285
	i32 1813201214, ; 348: Xamarin.Google.Android.Material => 0x6c13413e => 279
	i32 1818569960, ; 349: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 259
	i32 1818787751, ; 350: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 351: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 352: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827118058, ; 353: pl\System.ServiceModel.NetNamedPipe.resources => 0x6ce79bea => 371
	i32 1827303595, ; 354: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 405
	i32 1828688058, ; 355: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 181
	i32 1834522491, ; 356: pt-BR\System.ServiceModel.Http.resources => 0x6d58977b => 346
	i32 1842015223, ; 357: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 320
	i32 1847515442, ; 358: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 209
	i32 1852096909, ; 359: tr/System.ServiceModel.NetTcp.resources.dll => 0x6e64c18d => 387
	i32 1853025655, ; 360: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 317
	i32 1858542181, ; 361: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870090363, ; 362: ko/System.ServiceModel.NetNamedPipe.resources.dll => 0x6f77507b => 370
	i32 1870277092, ; 363: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 364: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 299
	i32 1879696579, ; 365: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1882505209, ; 366: tr/System.ServiceModel.Primitives.resources.dll => 0x7034bff9 => 400
	i32 1885316902, ; 367: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 220
	i32 1885918049, ; 368: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 405
	i32 1888955245, ; 369: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 370: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 371: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 372: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 373: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1922109462, ; 374: System.ServiceModel.Primitives.dll => 0x72911016 => 205
	i32 1932085498, ; 375: fr\System.ServiceModel.Primitives.resources => 0x732948fa => 393
	i32 1939592360, ; 376: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1946106882, ; 377: es\System.ServiceModel.NetFramingBase.resources => 0x73ff3c02 => 353
	i32 1954170934, ; 378: fr/System.ServiceModel.Federation.resources.dll => 0x747a4836 => 328
	i32 1956758971, ; 379: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1960645073, ; 380: ko\System.ServiceModel.NetTcp.resources => 0x74dd11d1 => 383
	i32 1961813231, ; 381: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 266
	i32 1968388702, ; 382: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 176
	i32 1973329537, ; 383: ru/System.ServiceModel.NetFramingBase.resources.dll => 0x759e9e81 => 360
	i32 1983156543, ; 384: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 286
	i32 1985761444, ; 385: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 211
	i32 1986222447, ; 386: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 188
	i32 1999793157, ; 387: ja/System.ServiceModel.NetTcp.resources.dll => 0x77326c05 => 382
	i32 2003115576, ; 388: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 296
	i32 2011961780, ; 389: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 390: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 251
	i32 2025202353, ; 391: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 291
	i32 2031763787, ; 392: Xamarin.Android.Glide => 0x791a414b => 208
	i32 2045470958, ; 393: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 394: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 246
	i32 2060060697, ; 395: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 396: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 295
	i32 2070888862, ; 397: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2078280433, ; 398: zh-Hans/System.ServiceModel.NetFramingBase.resources.dll => 0x7be00af1 => 362
	i32 2079903147, ; 399: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2085039813, ; 400: System.Security.Cryptography.Xml.dll => 0x7c472ec5 => 198
	i32 2086675053, ; 401: System.ServiceModel.NetFramingBase.dll => 0x7c60226d => 201
	i32 2090596640, ; 402: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2092919810, ; 403: System.ServiceModel.dll => 0x7cbf6c02 => 207
	i32 2093814594, ; 404: Microsoft.IdentityModel.Tokens.Saml.dll => 0x7ccd1342 => 189
	i32 2098812199, ; 405: de/System.ServiceModel.Http.resources.dll => 0x7d195527 => 339
	i32 2118004960, ; 406: fr\System.ServiceModel.NetNamedPipe.resources => 0x7e3e30e0 => 367
	i32 2127167465, ; 407: System.Console => 0x7ec9ffe9 => 20
	i32 2132115774, ; 408: zh-Hant/System.ServiceModel.NetFramingBase.resources.dll => 0x7f15813e => 363
	i32 2142473426, ; 409: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 410: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 411: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 412: Microsoft.Maui => 0x80bd55ad => 194
	i32 2169148018, ; 413: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 303
	i32 2181898931, ; 414: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2192057212, ; 415: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 181
	i32 2193016926, ; 416: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 417: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 290
	i32 2201231467, ; 418: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 419: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 183
	i32 2207618523, ; 420: it\Microsoft.Maui.Controls.resources => 0x839595db => 305
	i32 2217644978, ; 421: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 273
	i32 2222056684, ; 422: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2223829768, ; 423: ko/System.ServiceModel.Primitives.resources.dll => 0x848cf308 => 396
	i32 2224792570, ; 424: zh-Hant/System.ServiceModel.NetTcp.resources.dll => 0x849ba3fa => 389
	i32 2227276228, ; 425: cs\System.ServiceModel.NetFramingBase.resources => 0x84c189c4 => 351
	i32 2244775296, ; 426: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 255
	i32 2252106437, ; 427: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 428: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 429: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 430: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 177
	i32 2267999099, ; 431: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 210
	i32 2270573516, ; 432: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 299
	i32 2279755925, ; 433: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 262
	i32 2292263403, ; 434: zh-Hant\System.ServiceModel.Primitives.resources => 0x88a129eb => 402
	i32 2293034957, ; 435: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2294984242, ; 436: pl/System.ServiceModel.NetFramingBase.resources.dll => 0x88caae32 => 358
	i32 2295906218, ; 437: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 438: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 439: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 309
	i32 2305521784, ; 440: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2306840234, ; 441: cs\System.ServiceModel.Federation.resources => 0x897f96aa => 325
	i32 2315684594, ; 442: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 214
	i32 2320631194, ; 443: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2333576127, ; 444: pt-BR/System.ServiceModel.NetTcp.resources.dll => 0x8b178bbf => 385
	i32 2340441535, ; 445: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 446: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2348932370, ; 447: Microsoft.IdentityModel.Tokens.Saml => 0x8c01dd12 => 189
	i32 2353062107, ; 448: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 449: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 450: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 186
	i32 2371007202, ; 451: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 176
	i32 2378619854, ; 452: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 453: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2393708825, ; 454: es\System.ServiceModel.Http.resources => 0x8ead1919 => 340
	i32 2395872292, ; 455: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 304
	i32 2401565422, ; 456: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 457: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 237
	i32 2409983638, ; 458: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 404
	i32 2421380589, ; 459: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 460: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 224
	i32 2427813419, ; 461: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 301
	i32 2435356389, ; 462: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 463: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 464: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2454894271, ; 465: pl/System.ServiceModel.NetTcp.resources.dll => 0x9252b6bf => 384
	i32 2458678730, ; 466: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 467: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 468: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 227
	i32 2466230705, ; 469: fr/System.ServiceModel.Http.resources.dll => 0x92ffb1b1 => 341
	i32 2471841756, ; 470: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 471: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 472: Microsoft.Maui.Controls => 0x93dba8a1 => 192
	i32 2483903535, ; 473: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 474: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 475: System.AppContext.dll => 0x94798bc5 => 6
	i32 2491939797, ; 476: pt-BR\System.ServiceModel.NetNamedPipe.resources => 0x9487fbd5 => 372
	i32 2501346920, ; 477: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503402960, ; 478: de\System.ServiceModel.NetFramingBase.resources => 0x9536e5d0 => 352
	i32 2505896520, ; 479: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 249
	i32 2522472828, ; 480: Xamarin.Android.Glide.dll => 0x9659e17c => 208
	i32 2538310050, ; 481: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2539621919, ; 482: es/System.ServiceModel.Federation.resources.dll => 0x975f8e1f => 327
	i32 2550873716, ; 483: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 302
	i32 2562349572, ; 484: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 485: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2574359397, ; 486: tr\System.ServiceModel.NetFramingBase.resources => 0x99719b65 => 361
	i32 2577645437, ; 487: ko/System.ServiceModel.NetFramingBase.resources.dll => 0x99a3bf7d => 357
	i32 2581783588, ; 488: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 250
	i32 2581819634, ; 489: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 272
	i32 2585220780, ; 490: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 491: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 492: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2591523840, ; 493: it/System.ServiceModel.Primitives.resources.dll => 0x9a778400 => 394
	i32 2593496499, ; 494: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 311
	i32 2605712449, ; 495: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 290
	i32 2615233544, ; 496: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 241
	i32 2616218305, ; 497: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 182
	i32 2617129537, ; 498: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 499: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 500: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 231
	i32 2624644809, ; 501: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 236
	i32 2626831493, ; 502: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 306
	i32 2627185994, ; 503: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 504: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 505: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 245
	i32 2640290731, ; 506: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 186
	i32 2654295266, ; 507: ru/System.ServiceModel.NetTcp.resources.dll => 0x9e3554e2 => 386
	i32 2659772221, ; 508: es\System.ServiceModel.Federation.resources => 0x9e88e73d => 327
	i32 2663391936, ; 509: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 210
	i32 2663698177, ; 510: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 511: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 512: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 513: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 514: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 515: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 516: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 270
	i32 2705927368, ; 517: zh-Hant/System.ServiceModel.Federation.resources.dll => 0xa1492cc8 => 337
	i32 2712765783, ; 518: pl/System.ServiceModel.Primitives.resources.dll => 0xa1b18557 => 397
	i32 2715334215, ; 519: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 520: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 521: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 522: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2724977475, ; 523: pt-BR/System.ServiceModel.Federation.resources.dll => 0xa26bdb43 => 333
	i32 2732626843, ; 524: Xamarin.AndroidX.Activity => 0xa2e0939b => 212
	i32 2735172069, ; 525: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 526: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 218
	i32 2740877318, ; 527: it\System.ServiceModel.NetTcp.resources => 0xa35e7806 => 381
	i32 2740948882, ; 528: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2742465751, ; 529: zh-Hans/System.ServiceModel.NetTcp.resources.dll => 0xa376b4d7 => 388
	i32 2748088231, ; 530: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 531: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 312
	i32 2753493119, ; 532: System.ServiceModel.Security.dll => 0xa41ef87f => 206
	i32 2756478476, ; 533: zh-Hant\System.ServiceModel.NetTcp.resources => 0xa44c860c => 389
	i32 2758225723, ; 534: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 193
	i32 2764765095, ; 535: Microsoft.Maui.dll => 0xa4caf7a7 => 194
	i32 2765824710, ; 536: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 537: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 284
	i32 2778768386, ; 538: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 275
	i32 2779977773, ; 539: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 263
	i32 2780661947, ; 540: pl/System.ServiceModel.NetNamedPipe.resources.dll => 0xa5bd88bb => 371
	i32 2785988530, ; 541: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 318
	i32 2788224221, ; 542: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 241
	i32 2801831435, ; 543: Microsoft.Maui.Graphics => 0xa7008e0b => 196
	i32 2803228030, ; 544: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 545: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 297
	i32 2810250172, ; 546: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 228
	i32 2819470561, ; 547: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 548: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 549: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 263
	i32 2822016028, ; 550: zh-Hans/System.ServiceModel.NetNamedPipe.resources.dll => 0xa8348c1c => 375
	i32 2824502124, ; 551: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 552: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 310
	i32 2838993487, ; 553: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 252
	i32 2849599387, ; 554: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 555: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 275
	i32 2855708567, ; 556: Xamarin.AndroidX.Transition => 0xaa36a797 => 271
	i32 2861098320, ; 557: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 558: Microsoft.Maui.Essentials => 0xaa8a4878 => 195
	i32 2868488919, ; 559: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 560: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 213
	i32 2875164099, ; 561: Jsr305Binding.dll => 0xab5f85c3 => 280
	i32 2875220617, ; 562: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 563: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 239
	i32 2887636118, ; 564: System.Net.dll => 0xac1dd496 => 81
	i32 2899241291, ; 565: it\System.ServiceModel.Http.resources => 0xaccee94b => 342
	i32 2899753641, ; 566: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 567: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 568: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 569: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 570: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 571: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 276
	i32 2917500511, ; 572: zh-Hant/System.ServiceModel.NetNamedPipe.resources.dll => 0xade5865f => 376
	i32 2919462931, ; 573: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 574: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 215
	i32 2921417940, ; 575: System.Security.Cryptography.Xml => 0xae214cd4 => 198
	i32 2936416060, ; 576: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 577: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 578: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2958066338, ; 579: pl\System.ServiceModel.Primitives.resources => 0xb05082a2 => 397
	i32 2958246600, ; 580: de\System.ServiceModel.Http.resources => 0xb05342c8 => 339
	i32 2959614098, ; 581: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 582: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 583: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 584: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 235
	i32 2985026235, ; 585: ja\System.ServiceModel.NetNamedPipe.resources => 0xb1ebe2bb => 369
	i32 2987532451, ; 586: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 266
	i32 2996846495, ; 587: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 248
	i32 3016983068, ; 588: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 268
	i32 3022610030, ; 589: ja\System.ServiceModel.Http.resources => 0xb4295e6e => 343
	i32 3023353419, ; 590: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 591: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 243
	i32 3038032645, ; 592: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 406
	i32 3046511124, ; 593: es/System.ServiceModel.Primitives.resources.dll => 0xb5961214 => 392
	i32 3049900938, ; 594: pt-BR/System.ServiceModel.NetNamedPipe.resources.dll => 0xb5c9cb8a => 372
	i32 3056245963, ; 595: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 265
	i32 3057625584, ; 596: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 256
	i32 3059408633, ; 597: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 598: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 599: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 600: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 303
	i32 3084678329, ; 601: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 188
	i32 3090735792, ; 602: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 603: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 604: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 605: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 606: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3123044289, ; 607: System.ServiceModel.Duplex => 0xba25dfc1 => 204
	i32 3123119788, ; 608: Microsoft.IdentityModel.Protocols.WsTrust.dll => 0xba2706ac => 187
	i32 3124832203, ; 609: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 610: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 611: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 612: GoogleGson.dll => 0xbba64c02 => 175
	i32 3157052235, ; 613: System.ServiceModel.Federation.dll => 0xbc2ccb4b => 199
	i32 3159123045, ; 614: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3159587175, ; 615: cs/System.ServiceModel.Http.resources.dll => 0xbc537967 => 338
	i32 3160747431, ; 616: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 617: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 257
	i32 3184440510, ; 618: pt-BR\System.ServiceModel.Federation.resources => 0xbdceb4be => 333
	i32 3192346100, ; 619: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 620: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 621: System.Data.dll => 0xbefef58f => 24
	i32 3206733304, ; 622: ja/System.ServiceModel.Federation.resources.dll => 0xbf22ddf8 => 330
	i32 3209718065, ; 623: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 624: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 234
	i32 3220365878, ; 625: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 626: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3241028803, ; 627: it\System.ServiceModel.NetNamedPipe.resources => 0xc12e2cc3 => 368
	i32 3251039220, ; 628: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 629: Xamarin.AndroidX.CardView => 0xc235e84d => 222
	i32 3265493905, ; 630: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 631: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 632: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3278332997, ; 633: zh-Hans/System.ServiceModel.Http.resources.dll => 0xc3676445 => 349
	i32 3279906254, ; 634: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 635: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 636: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3291006565, ; 637: fr\System.ServiceModel.NetTcp.resources => 0xc428c665 => 380
	i32 3299363146, ; 638: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 639: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 640: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 298
	i32 3316684772, ; 641: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 642: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 232
	i32 3317144872, ; 643: System.Data => 0xc5b79d28 => 24
	i32 3340202976, ; 644: tr\System.ServiceModel.NetNamedPipe.resources => 0xc71773e0 => 374
	i32 3340431453, ; 645: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 220
	i32 3345895724, ; 646: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 261
	i32 3346324047, ; 647: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 258
	i32 3347128195, ; 648: tr\System.ServiceModel.Http.resources => 0xc7811f83 => 348
	i32 3357674450, ; 649: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 315
	i32 3358260929, ; 650: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 651: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 213
	i32 3362522851, ; 652: Xamarin.AndroidX.Core => 0xc86c06e3 => 229
	i32 3366347497, ; 653: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 654: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 262
	i32 3381016424, ; 655: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 294
	i32 3395150330, ; 656: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 657: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 658: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 233
	i32 3406727474, ; 659: zh-Hant\System.ServiceModel.Federation.resources => 0xcb0e8932 => 337
	i32 3428513518, ; 660: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 178
	i32 3429136800, ; 661: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 662: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 663: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 236
	i32 3445260447, ; 664: System.Formats.Tar => 0xcd5a809f => 39
	i32 3447165740, ; 665: ja/System.ServiceModel.Http.resources.dll => 0xcd77932c => 343
	i32 3450008806, ; 666: ja\System.ServiceModel.Federation.resources => 0xcda2f4e6 => 330
	i32 3452344032, ; 667: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 191
	i32 3453180490, ; 668: ko\System.ServiceModel.Primitives.resources => 0xcdd35a4a => 396
	i32 3463511458, ; 669: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 302
	i32 3471940407, ; 670: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 671: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 672: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 315
	i32 3482217531, ; 673: cs\System.ServiceModel.Http.resources => 0xcf8e6c3b => 338
	i32 3483609038, ; 674: es/System.ServiceModel.Http.resources.dll => 0xcfa3a7ce => 340
	i32 3484440000, ; 675: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 314
	i32 3485117614, ; 676: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 677: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 678: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 225
	i32 3509114376, ; 679: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 680: System.Security.dll => 0xd1854eb4 => 130
	i32 3521184679, ; 681: ru\System.ServiceModel.NetFramingBase.resources => 0xd1e103a7 => 360
	i32 3530912306, ; 682: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 683: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3548480101, ; 684: de/System.ServiceModel.Federation.resources.dll => 0xd3818265 => 326
	i32 3560100363, ; 685: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 686: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580333612, ; 687: zh-Hans\System.ServiceModel.Federation.resources => 0xd5678e2c => 336
	i32 3580758918, ; 688: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 322
	i32 3597029428, ; 689: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 211
	i32 3598340787, ; 690: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3605274052, ; 691: ja\System.ServiceModel.NetFramingBase.resources => 0xd6e41dc4 => 356
	i32 3605918211, ; 692: tr\System.ServiceModel.NetTcp.resources => 0xd6edf203 => 387
	i32 3608519521, ; 693: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 694: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 695: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 260
	i32 3632773286, ; 696: zh-Hans\System.ServiceModel.NetNamedPipe.resources => 0xd887b8a6 => 375
	i32 3633644679, ; 697: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 215
	i32 3638233600, ; 698: ru\System.ServiceModel.Primitives.resources => 0xd8db0a00 => 399
	i32 3638274909, ; 699: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 700: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 246
	i32 3641688426, ; 701: it/System.ServiceModel.NetFramingBase.resources.dll => 0xd90fc16a => 355
	i32 3643446276, ; 702: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 319
	i32 3643854240, ; 703: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 257
	i32 3645089577, ; 704: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 705: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 177
	i32 3660523487, ; 706: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3664118907, ; 707: pt-BR\System.ServiceModel.Primitives.resources => 0xda66047b => 398
	i32 3672681054, ; 708: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3675849680, ; 709: cs\System.ServiceModel.NetTcp.resources => 0xdb1903d0 => 377
	i32 3676670898, ; 710: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 403
	i32 3680281109, ; 711: ko/System.ServiceModel.Http.resources.dll => 0xdb5ca215 => 344
	i32 3682565725, ; 712: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 221
	i32 3684561358, ; 713: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 225
	i32 3685718856, ; 714: pl/System.ServiceModel.Federation.resources.dll => 0xdbaf9b48 => 332
	i32 3690488555, ; 715: pl\System.ServiceModel.NetTcp.resources => 0xdbf862eb => 384
	i32 3697841164, ; 716: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 324
	i32 3700619798, ; 717: pt-BR/System.ServiceModel.NetFramingBase.resources.dll => 0xdc92fa16 => 359
	i32 3700866549, ; 718: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3705132617, ; 719: it\System.ServiceModel.NetFramingBase.resources => 0xdcd7d649 => 355
	i32 3706696989, ; 720: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 230
	i32 3709546624, ; 721: ru\System.ServiceModel.NetTcp.resources => 0xdd1b3080 => 386
	i32 3716563718, ; 722: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 723: Xamarin.AndroidX.Annotation => 0xdda814c6 => 214
	i32 3724971120, ; 724: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 256
	i32 3732100267, ; 725: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 726: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3743991391, ; 727: de\System.ServiceModel.NetTcp.resources => 0xdf28c65f => 378
	i32 3748608112, ; 728: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 729: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3765508441, ; 730: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 183
	i32 3786282454, ; 731: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 223
	i32 3792276235, ; 732: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 733: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 191
	i32 3802395368, ; 734: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3807198597, ; 735: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 197
	i32 3813989096, ; 736: ko\System.ServiceModel.NetFramingBase.resources => 0xe354dae8 => 357
	i32 3817368567, ; 737: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 738: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 739: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 740: System.Numerics.dll => 0xe4436460 => 83
	i32 3831382396, ; 741: es\System.ServiceModel.Primitives.resources => 0xe45e417c => 392
	i32 3836405899, ; 742: cs/System.ServiceModel.Federation.resources.dll => 0xe4aae88b => 325
	i32 3841636137, ; 743: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 179
	i32 3844307129, ; 744: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 745: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 746: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 747: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 748: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876601672, ; 749: zh-Hans\System.ServiceModel.NetFramingBase.resources => 0xe7103f48 => 362
	i32 3885497537, ; 750: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 751: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 271
	i32 3888767677, ; 752: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 261
	i32 3889960447, ; 753: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 323
	i32 3896106733, ; 754: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 755: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 229
	i32 3901907137, ; 756: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3917319797, ; 757: System.ServiceModel.Federation => 0xe97d8e75 => 199
	i32 3920810846, ; 758: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 759: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 274
	i32 3928044579, ; 760: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 761: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 762: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 259
	i32 3945713374, ; 763: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3948719759, ; 764: es/System.ServiceModel.NetFramingBase.resources.dll => 0xeb5cae8f => 353
	i32 3953953790, ; 765: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 766: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 217
	i32 3959773229, ; 767: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 248
	i32 3971291721, ; 768: System.ServiceModel.NetNamedPipe.dll => 0xecb51a49 => 202
	i32 3980434154, ; 769: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 318
	i32 3987592930, ; 770: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 300
	i32 4003436829, ; 771: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 772: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 216
	i32 4025784931, ; 773: System.Memory => 0xeff49a63 => 62
	i32 4043772061, ; 774: zh-Hans/System.ServiceModel.Federation.resources.dll => 0xf107109d => 336
	i32 4046471985, ; 775: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 193
	i32 4054681211, ; 776: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 777: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 778: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4081805871, ; 779: zh-Hans\System.ServiceModel.Primitives.resources => 0xf34b6a2f => 401
	i32 4094352644, ; 780: Microsoft.Maui.Essentials.dll => 0xf40add04 => 195
	i32 4099507663, ; 781: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 782: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 783: Xamarin.AndroidX.Emoji2 => 0xf479582c => 237
	i32 4102112229, ; 784: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 313
	i32 4120300202, ; 785: de/System.ServiceModel.NetNamedPipe.resources.dll => 0xf596caaa => 365
	i32 4125707920, ; 786: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 308
	i32 4126470640, ; 787: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 178
	i32 4127667938, ; 788: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 789: System.AppContext => 0xf6318da0 => 6
	i32 4137271634, ; 790: Microsoft.IdentityModel.Xml.dll => 0xf699c152 => 190
	i32 4147710070, ; 791: ko\System.ServiceModel.NetNamedPipe.resources => 0xf7390876 => 370
	i32 4147896353, ; 792: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 793: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 320
	i32 4151237749, ; 794: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 795: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 796: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 797: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 798: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 799: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 253
	i32 4182880526, ; 800: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 404
	i32 4185676441, ; 801: System.Security => 0xf97c5a99 => 130
	i32 4195421176, ; 802: TaskyAndroid => 0xfa110bf8 => 0
	i32 4196529839, ; 803: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 804: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 805: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 230
	i32 4258378803, ; 806: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 252
	i32 4260525087, ; 807: System.Buffers => 0xfdf2741f => 7
	i32 4261754524, ; 808: ko\System.ServiceModel.Http.resources => 0xfe05369c => 344
	i32 4266814471, ; 809: zh-Hant\System.ServiceModel.NetNamedPipe.resources => 0xfe526c07 => 376
	i32 4271975918, ; 810: Microsoft.Maui.Controls.dll => 0xfea12dee => 192
	i32 4274976490, ; 811: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 812: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 253
	i32 4294763496 ; 813: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 239
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [814 x i32] [
	i32 68, ; 0
	i32 354, ; 1
	i32 67, ; 2
	i32 108, ; 3
	i32 379, ; 4
	i32 335, ; 5
	i32 249, ; 6
	i32 283, ; 7
	i32 48, ; 8
	i32 80, ; 9
	i32 145, ; 10
	i32 204, ; 11
	i32 30, ; 12
	i32 324, ; 13
	i32 124, ; 14
	i32 364, ; 15
	i32 196, ; 16
	i32 102, ; 17
	i32 395, ; 18
	i32 267, ; 19
	i32 107, ; 20
	i32 267, ; 21
	i32 139, ; 22
	i32 287, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 223, ; 27
	i32 352, ; 28
	i32 132, ; 29
	i32 269, ; 30
	i32 151, ; 31
	i32 341, ; 32
	i32 365, ; 33
	i32 321, ; 34
	i32 322, ; 35
	i32 18, ; 36
	i32 221, ; 37
	i32 331, ; 38
	i32 26, ; 39
	i32 243, ; 40
	i32 1, ; 41
	i32 399, ; 42
	i32 59, ; 43
	i32 42, ; 44
	i32 91, ; 45
	i32 366, ; 46
	i32 226, ; 47
	i32 147, ; 48
	i32 245, ; 49
	i32 242, ; 50
	i32 293, ; 51
	i32 394, ; 52
	i32 54, ; 53
	i32 349, ; 54
	i32 69, ; 55
	i32 345, ; 56
	i32 321, ; 57
	i32 212, ; 58
	i32 383, ; 59
	i32 83, ; 60
	i32 356, ; 61
	i32 306, ; 62
	i32 244, ; 63
	i32 305, ; 64
	i32 131, ; 65
	i32 377, ; 66
	i32 55, ; 67
	i32 149, ; 68
	i32 74, ; 69
	i32 145, ; 70
	i32 62, ; 71
	i32 146, ; 72
	i32 406, ; 73
	i32 165, ; 74
	i32 366, ; 75
	i32 317, ; 76
	i32 227, ; 77
	i32 12, ; 78
	i32 240, ; 79
	i32 125, ; 80
	i32 401, ; 81
	i32 152, ; 82
	i32 113, ; 83
	i32 166, ; 84
	i32 164, ; 85
	i32 0, ; 86
	i32 242, ; 87
	i32 367, ; 88
	i32 255, ; 89
	i32 84, ; 90
	i32 304, ; 91
	i32 348, ; 92
	i32 298, ; 93
	i32 185, ; 94
	i32 382, ; 95
	i32 378, ; 96
	i32 150, ; 97
	i32 287, ; 98
	i32 60, ; 99
	i32 395, ; 100
	i32 374, ; 101
	i32 180, ; 102
	i32 51, ; 103
	i32 103, ; 104
	i32 114, ; 105
	i32 40, ; 106
	i32 280, ; 107
	i32 207, ; 108
	i32 335, ; 109
	i32 278, ; 110
	i32 120, ; 111
	i32 388, ; 112
	i32 312, ; 113
	i32 173, ; 114
	i32 52, ; 115
	i32 44, ; 116
	i32 119, ; 117
	i32 379, ; 118
	i32 232, ; 119
	i32 310, ; 120
	i32 400, ; 121
	i32 391, ; 122
	i32 238, ; 123
	i32 81, ; 124
	i32 206, ; 125
	i32 326, ; 126
	i32 136, ; 127
	i32 274, ; 128
	i32 219, ; 129
	i32 8, ; 130
	i32 73, ; 131
	i32 292, ; 132
	i32 155, ; 133
	i32 289, ; 134
	i32 154, ; 135
	i32 92, ; 136
	i32 364, ; 137
	i32 284, ; 138
	i32 45, ; 139
	i32 307, ; 140
	i32 197, ; 141
	i32 295, ; 142
	i32 393, ; 143
	i32 288, ; 144
	i32 109, ; 145
	i32 129, ; 146
	i32 25, ; 147
	i32 209, ; 148
	i32 72, ; 149
	i32 55, ; 150
	i32 368, ; 151
	i32 46, ; 152
	i32 316, ; 153
	i32 184, ; 154
	i32 233, ; 155
	i32 22, ; 156
	i32 247, ; 157
	i32 86, ; 158
	i32 350, ; 159
	i32 202, ; 160
	i32 43, ; 161
	i32 160, ; 162
	i32 71, ; 163
	i32 260, ; 164
	i32 398, ; 165
	i32 3, ; 166
	i32 42, ; 167
	i32 63, ; 168
	i32 16, ; 169
	i32 53, ; 170
	i32 319, ; 171
	i32 283, ; 172
	i32 105, ; 173
	i32 288, ; 174
	i32 354, ; 175
	i32 281, ; 176
	i32 244, ; 177
	i32 200, ; 178
	i32 34, ; 179
	i32 158, ; 180
	i32 332, ; 181
	i32 85, ; 182
	i32 32, ; 183
	i32 12, ; 184
	i32 51, ; 185
	i32 56, ; 186
	i32 264, ; 187
	i32 36, ; 188
	i32 179, ; 189
	i32 294, ; 190
	i32 282, ; 191
	i32 351, ; 192
	i32 217, ; 193
	i32 35, ; 194
	i32 58, ; 195
	i32 347, ; 196
	i32 251, ; 197
	i32 175, ; 198
	i32 200, ; 199
	i32 17, ; 200
	i32 285, ; 201
	i32 381, ; 202
	i32 164, ; 203
	i32 334, ; 204
	i32 307, ; 205
	i32 250, ; 206
	i32 182, ; 207
	i32 347, ; 208
	i32 328, ; 209
	i32 350, ; 210
	i32 277, ; 211
	i32 313, ; 212
	i32 153, ; 213
	i32 273, ; 214
	i32 258, ; 215
	i32 311, ; 216
	i32 219, ; 217
	i32 342, ; 218
	i32 203, ; 219
	i32 29, ; 220
	i32 52, ; 221
	i32 309, ; 222
	i32 278, ; 223
	i32 5, ; 224
	i32 293, ; 225
	i32 268, ; 226
	i32 272, ; 227
	i32 224, ; 228
	i32 289, ; 229
	i32 216, ; 230
	i32 235, ; 231
	i32 358, ; 232
	i32 345, ; 233
	i32 85, ; 234
	i32 380, ; 235
	i32 277, ; 236
	i32 61, ; 237
	i32 385, ; 238
	i32 112, ; 239
	i32 329, ; 240
	i32 373, ; 241
	i32 57, ; 242
	i32 323, ; 243
	i32 264, ; 244
	i32 99, ; 245
	i32 205, ; 246
	i32 190, ; 247
	i32 19, ; 248
	i32 228, ; 249
	i32 111, ; 250
	i32 101, ; 251
	i32 102, ; 252
	i32 402, ; 253
	i32 291, ; 254
	i32 363, ; 255
	i32 104, ; 256
	i32 281, ; 257
	i32 71, ; 258
	i32 390, ; 259
	i32 38, ; 260
	i32 32, ; 261
	i32 103, ; 262
	i32 73, ; 263
	i32 297, ; 264
	i32 9, ; 265
	i32 123, ; 266
	i32 46, ; 267
	i32 218, ; 268
	i32 185, ; 269
	i32 9, ; 270
	i32 43, ; 271
	i32 4, ; 272
	i32 265, ; 273
	i32 301, ; 274
	i32 359, ; 275
	i32 296, ; 276
	i32 31, ; 277
	i32 138, ; 278
	i32 92, ; 279
	i32 93, ; 280
	i32 316, ; 281
	i32 201, ; 282
	i32 49, ; 283
	i32 141, ; 284
	i32 112, ; 285
	i32 140, ; 286
	i32 234, ; 287
	i32 203, ; 288
	i32 115, ; 289
	i32 282, ; 290
	i32 157, ; 291
	i32 403, ; 292
	i32 76, ; 293
	i32 79, ; 294
	i32 254, ; 295
	i32 37, ; 296
	i32 276, ; 297
	i32 187, ; 298
	i32 346, ; 299
	i32 390, ; 300
	i32 174, ; 301
	i32 238, ; 302
	i32 231, ; 303
	i32 64, ; 304
	i32 138, ; 305
	i32 15, ; 306
	i32 369, ; 307
	i32 116, ; 308
	i32 270, ; 309
	i32 279, ; 310
	i32 373, ; 311
	i32 226, ; 312
	i32 48, ; 313
	i32 70, ; 314
	i32 80, ; 315
	i32 126, ; 316
	i32 94, ; 317
	i32 121, ; 318
	i32 286, ; 319
	i32 26, ; 320
	i32 331, ; 321
	i32 247, ; 322
	i32 97, ; 323
	i32 28, ; 324
	i32 222, ; 325
	i32 314, ; 326
	i32 292, ; 327
	i32 149, ; 328
	i32 169, ; 329
	i32 329, ; 330
	i32 4, ; 331
	i32 98, ; 332
	i32 33, ; 333
	i32 93, ; 334
	i32 269, ; 335
	i32 180, ; 336
	i32 391, ; 337
	i32 21, ; 338
	i32 41, ; 339
	i32 170, ; 340
	i32 308, ; 341
	i32 361, ; 342
	i32 240, ; 343
	i32 334, ; 344
	i32 300, ; 345
	i32 254, ; 346
	i32 285, ; 347
	i32 279, ; 348
	i32 259, ; 349
	i32 2, ; 350
	i32 134, ; 351
	i32 111, ; 352
	i32 371, ; 353
	i32 405, ; 354
	i32 181, ; 355
	i32 346, ; 356
	i32 320, ; 357
	i32 209, ; 358
	i32 387, ; 359
	i32 317, ; 360
	i32 58, ; 361
	i32 370, ; 362
	i32 95, ; 363
	i32 299, ; 364
	i32 39, ; 365
	i32 400, ; 366
	i32 220, ; 367
	i32 405, ; 368
	i32 25, ; 369
	i32 94, ; 370
	i32 89, ; 371
	i32 99, ; 372
	i32 10, ; 373
	i32 205, ; 374
	i32 393, ; 375
	i32 87, ; 376
	i32 353, ; 377
	i32 328, ; 378
	i32 100, ; 379
	i32 383, ; 380
	i32 266, ; 381
	i32 176, ; 382
	i32 360, ; 383
	i32 286, ; 384
	i32 211, ; 385
	i32 188, ; 386
	i32 382, ; 387
	i32 296, ; 388
	i32 7, ; 389
	i32 251, ; 390
	i32 291, ; 391
	i32 208, ; 392
	i32 88, ; 393
	i32 246, ; 394
	i32 154, ; 395
	i32 295, ; 396
	i32 33, ; 397
	i32 362, ; 398
	i32 116, ; 399
	i32 198, ; 400
	i32 201, ; 401
	i32 82, ; 402
	i32 207, ; 403
	i32 189, ; 404
	i32 339, ; 405
	i32 367, ; 406
	i32 20, ; 407
	i32 363, ; 408
	i32 11, ; 409
	i32 162, ; 410
	i32 3, ; 411
	i32 194, ; 412
	i32 303, ; 413
	i32 184, ; 414
	i32 181, ; 415
	i32 84, ; 416
	i32 290, ; 417
	i32 64, ; 418
	i32 183, ; 419
	i32 305, ; 420
	i32 273, ; 421
	i32 143, ; 422
	i32 396, ; 423
	i32 389, ; 424
	i32 351, ; 425
	i32 255, ; 426
	i32 157, ; 427
	i32 41, ; 428
	i32 117, ; 429
	i32 177, ; 430
	i32 210, ; 431
	i32 299, ; 432
	i32 262, ; 433
	i32 402, ; 434
	i32 131, ; 435
	i32 358, ; 436
	i32 75, ; 437
	i32 66, ; 438
	i32 309, ; 439
	i32 172, ; 440
	i32 325, ; 441
	i32 214, ; 442
	i32 143, ; 443
	i32 385, ; 444
	i32 106, ; 445
	i32 151, ; 446
	i32 189, ; 447
	i32 70, ; 448
	i32 156, ; 449
	i32 186, ; 450
	i32 176, ; 451
	i32 121, ; 452
	i32 127, ; 453
	i32 340, ; 454
	i32 304, ; 455
	i32 152, ; 456
	i32 237, ; 457
	i32 404, ; 458
	i32 141, ; 459
	i32 224, ; 460
	i32 301, ; 461
	i32 20, ; 462
	i32 14, ; 463
	i32 135, ; 464
	i32 384, ; 465
	i32 75, ; 466
	i32 59, ; 467
	i32 227, ; 468
	i32 341, ; 469
	i32 167, ; 470
	i32 168, ; 471
	i32 192, ; 472
	i32 15, ; 473
	i32 74, ; 474
	i32 6, ; 475
	i32 372, ; 476
	i32 23, ; 477
	i32 352, ; 478
	i32 249, ; 479
	i32 208, ; 480
	i32 91, ; 481
	i32 327, ; 482
	i32 302, ; 483
	i32 1, ; 484
	i32 136, ; 485
	i32 361, ; 486
	i32 357, ; 487
	i32 250, ; 488
	i32 272, ; 489
	i32 134, ; 490
	i32 69, ; 491
	i32 146, ; 492
	i32 394, ; 493
	i32 311, ; 494
	i32 290, ; 495
	i32 241, ; 496
	i32 182, ; 497
	i32 88, ; 498
	i32 96, ; 499
	i32 231, ; 500
	i32 236, ; 501
	i32 306, ; 502
	i32 31, ; 503
	i32 45, ; 504
	i32 245, ; 505
	i32 186, ; 506
	i32 386, ; 507
	i32 327, ; 508
	i32 210, ; 509
	i32 109, ; 510
	i32 158, ; 511
	i32 35, ; 512
	i32 22, ; 513
	i32 114, ; 514
	i32 57, ; 515
	i32 270, ; 516
	i32 337, ; 517
	i32 397, ; 518
	i32 144, ; 519
	i32 118, ; 520
	i32 120, ; 521
	i32 110, ; 522
	i32 333, ; 523
	i32 212, ; 524
	i32 139, ; 525
	i32 218, ; 526
	i32 381, ; 527
	i32 54, ; 528
	i32 388, ; 529
	i32 105, ; 530
	i32 312, ; 531
	i32 206, ; 532
	i32 389, ; 533
	i32 193, ; 534
	i32 194, ; 535
	i32 133, ; 536
	i32 284, ; 537
	i32 275, ; 538
	i32 263, ; 539
	i32 371, ; 540
	i32 318, ; 541
	i32 241, ; 542
	i32 196, ; 543
	i32 159, ; 544
	i32 297, ; 545
	i32 228, ; 546
	i32 163, ; 547
	i32 132, ; 548
	i32 263, ; 549
	i32 375, ; 550
	i32 161, ; 551
	i32 310, ; 552
	i32 252, ; 553
	i32 140, ; 554
	i32 275, ; 555
	i32 271, ; 556
	i32 169, ; 557
	i32 195, ; 558
	i32 174, ; 559
	i32 213, ; 560
	i32 280, ; 561
	i32 40, ; 562
	i32 239, ; 563
	i32 81, ; 564
	i32 342, ; 565
	i32 56, ; 566
	i32 37, ; 567
	i32 97, ; 568
	i32 166, ; 569
	i32 172, ; 570
	i32 276, ; 571
	i32 376, ; 572
	i32 82, ; 573
	i32 215, ; 574
	i32 198, ; 575
	i32 98, ; 576
	i32 30, ; 577
	i32 159, ; 578
	i32 397, ; 579
	i32 339, ; 580
	i32 18, ; 581
	i32 127, ; 582
	i32 119, ; 583
	i32 235, ; 584
	i32 369, ; 585
	i32 266, ; 586
	i32 248, ; 587
	i32 268, ; 588
	i32 343, ; 589
	i32 165, ; 590
	i32 243, ; 591
	i32 406, ; 592
	i32 392, ; 593
	i32 372, ; 594
	i32 265, ; 595
	i32 256, ; 596
	i32 170, ; 597
	i32 16, ; 598
	i32 144, ; 599
	i32 303, ; 600
	i32 188, ; 601
	i32 125, ; 602
	i32 118, ; 603
	i32 38, ; 604
	i32 115, ; 605
	i32 47, ; 606
	i32 204, ; 607
	i32 187, ; 608
	i32 142, ; 609
	i32 117, ; 610
	i32 34, ; 611
	i32 175, ; 612
	i32 199, ; 613
	i32 95, ; 614
	i32 338, ; 615
	i32 53, ; 616
	i32 257, ; 617
	i32 333, ; 618
	i32 129, ; 619
	i32 153, ; 620
	i32 24, ; 621
	i32 330, ; 622
	i32 161, ; 623
	i32 234, ; 624
	i32 148, ; 625
	i32 104, ; 626
	i32 368, ; 627
	i32 89, ; 628
	i32 222, ; 629
	i32 60, ; 630
	i32 142, ; 631
	i32 100, ; 632
	i32 349, ; 633
	i32 5, ; 634
	i32 13, ; 635
	i32 122, ; 636
	i32 380, ; 637
	i32 135, ; 638
	i32 28, ; 639
	i32 298, ; 640
	i32 72, ; 641
	i32 232, ; 642
	i32 24, ; 643
	i32 374, ; 644
	i32 220, ; 645
	i32 261, ; 646
	i32 258, ; 647
	i32 348, ; 648
	i32 315, ; 649
	i32 137, ; 650
	i32 213, ; 651
	i32 229, ; 652
	i32 168, ; 653
	i32 262, ; 654
	i32 294, ; 655
	i32 101, ; 656
	i32 123, ; 657
	i32 233, ; 658
	i32 337, ; 659
	i32 178, ; 660
	i32 163, ; 661
	i32 167, ; 662
	i32 236, ; 663
	i32 39, ; 664
	i32 343, ; 665
	i32 330, ; 666
	i32 191, ; 667
	i32 396, ; 668
	i32 302, ; 669
	i32 17, ; 670
	i32 171, ; 671
	i32 315, ; 672
	i32 338, ; 673
	i32 340, ; 674
	i32 314, ; 675
	i32 137, ; 676
	i32 150, ; 677
	i32 225, ; 678
	i32 155, ; 679
	i32 130, ; 680
	i32 360, ; 681
	i32 19, ; 682
	i32 65, ; 683
	i32 326, ; 684
	i32 147, ; 685
	i32 47, ; 686
	i32 336, ; 687
	i32 322, ; 688
	i32 211, ; 689
	i32 79, ; 690
	i32 356, ; 691
	i32 387, ; 692
	i32 61, ; 693
	i32 106, ; 694
	i32 260, ; 695
	i32 375, ; 696
	i32 215, ; 697
	i32 399, ; 698
	i32 49, ; 699
	i32 246, ; 700
	i32 355, ; 701
	i32 319, ; 702
	i32 257, ; 703
	i32 14, ; 704
	i32 177, ; 705
	i32 68, ; 706
	i32 398, ; 707
	i32 171, ; 708
	i32 377, ; 709
	i32 403, ; 710
	i32 344, ; 711
	i32 221, ; 712
	i32 225, ; 713
	i32 332, ; 714
	i32 384, ; 715
	i32 324, ; 716
	i32 359, ; 717
	i32 78, ; 718
	i32 355, ; 719
	i32 230, ; 720
	i32 386, ; 721
	i32 108, ; 722
	i32 214, ; 723
	i32 256, ; 724
	i32 67, ; 725
	i32 63, ; 726
	i32 378, ; 727
	i32 27, ; 728
	i32 160, ; 729
	i32 183, ; 730
	i32 223, ; 731
	i32 10, ; 732
	i32 191, ; 733
	i32 11, ; 734
	i32 197, ; 735
	i32 357, ; 736
	i32 173, ; 737
	i32 78, ; 738
	i32 126, ; 739
	i32 83, ; 740
	i32 392, ; 741
	i32 325, ; 742
	i32 179, ; 743
	i32 66, ; 744
	i32 107, ; 745
	i32 65, ; 746
	i32 128, ; 747
	i32 122, ; 748
	i32 362, ; 749
	i32 77, ; 750
	i32 271, ; 751
	i32 261, ; 752
	i32 323, ; 753
	i32 8, ; 754
	i32 229, ; 755
	i32 2, ; 756
	i32 199, ; 757
	i32 44, ; 758
	i32 274, ; 759
	i32 156, ; 760
	i32 128, ; 761
	i32 259, ; 762
	i32 23, ; 763
	i32 353, ; 764
	i32 133, ; 765
	i32 217, ; 766
	i32 248, ; 767
	i32 202, ; 768
	i32 318, ; 769
	i32 300, ; 770
	i32 29, ; 771
	i32 216, ; 772
	i32 62, ; 773
	i32 336, ; 774
	i32 193, ; 775
	i32 90, ; 776
	i32 87, ; 777
	i32 148, ; 778
	i32 401, ; 779
	i32 195, ; 780
	i32 36, ; 781
	i32 86, ; 782
	i32 237, ; 783
	i32 313, ; 784
	i32 365, ; 785
	i32 308, ; 786
	i32 178, ; 787
	i32 50, ; 788
	i32 6, ; 789
	i32 190, ; 790
	i32 370, ; 791
	i32 90, ; 792
	i32 320, ; 793
	i32 21, ; 794
	i32 162, ; 795
	i32 96, ; 796
	i32 50, ; 797
	i32 113, ; 798
	i32 253, ; 799
	i32 404, ; 800
	i32 130, ; 801
	i32 0, ; 802
	i32 76, ; 803
	i32 27, ; 804
	i32 230, ; 805
	i32 252, ; 806
	i32 7, ; 807
	i32 344, ; 808
	i32 376, ; 809
	i32 192, ; 810
	i32 110, ; 811
	i32 253, ; 812
	i32 239 ; 813
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
