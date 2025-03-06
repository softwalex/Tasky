; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [408 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [810 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 3921707, ; 1: fr\System.ServiceModel.NetFramingBase.resources => 0x3bd72b => 352
	i32 10166715, ; 2: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 3: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 17613696, ; 4: es\System.ServiceModel.NetTcp.resources => 0x10cc380 => 377
	i32 28923068, ; 5: tr\System.ServiceModel.Federation.resources => 0x1b954bc => 333
	i32 32687329, ; 6: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 247
	i32 34715100, ; 7: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 281
	i32 34839235, ; 8: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 53472207, ; 11: System.ServiceModel.Duplex.dll => 0x32febcf => 202
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 13: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 322
	i32 68219467, ; 14: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 71084978, ; 15: cs\System.ServiceModel.NetNamedPipe.resources => 0x43cabb2 => 362
	i32 72070932, ; 16: Microsoft.Maui.Graphics.dll => 0x44bb714 => 194
	i32 82292897, ; 17: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 85813540, ; 18: ja/System.ServiceModel.Primitives.resources.dll => 0x51d6924 => 393
	i32 101534019, ; 19: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 265
	i32 117431740, ; 20: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 21: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 265
	i32 122350210, ; 22: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 23: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 285
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 221
	i32 166617380, ; 28: de/System.ServiceModel.NetFramingBase.resources.dll => 0x9ee6124 => 350
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 267
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 192921502, ; 32: fr\System.ServiceModel.Http.resources => 0xb7fbf9e => 339
	i32 193868653, ; 33: de\System.ServiceModel.NetNamedPipe.resources => 0xb8e336d => 363
	i32 195452805, ; 34: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 319
	i32 199333315, ; 35: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 320
	i32 205061960, ; 36: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 37: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 219
	i32 209580789, ; 38: ko\System.ServiceModel.Federation.resources => 0xc7df2f5 => 329
	i32 220171995, ; 39: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 40: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 241
	i32 230752869, ; 41: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 230884747, ; 42: ru/System.ServiceModel.Primitives.resources.dll => 0xdc3058b => 397
	i32 231409092, ; 43: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 44: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 45: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 247181326, ; 46: es/System.ServiceModel.NetNamedPipe.resources.dll => 0xebbb00e => 364
	i32 261689757, ; 47: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 224
	i32 276479776, ; 48: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 49: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 243
	i32 280482487, ; 50: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 240
	i32 280992041, ; 51: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 291
	i32 285314186, ; 52: it\System.ServiceModel.Primitives.resources => 0x11018c8a => 392
	i32 291076382, ; 53: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 296834212, ; 54: zh-Hans\System.ServiceModel.Http.resources => 0x11b154a4 => 347
	i32 298918909, ; 55: System.Net.Ping.dll => 0x11d123fd => 69
	i32 316078633, ; 56: pl\System.ServiceModel.Http.resources => 0x12d6fa29 => 343
	i32 317674968, ; 57: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 319
	i32 318968648, ; 58: Xamarin.AndroidX.Activity.dll => 0x13031348 => 210
	i32 320721186, ; 59: ko/System.ServiceModel.NetTcp.resources.dll => 0x131dd122 => 381
	i32 321597661, ; 60: System.Numerics => 0x132b30dd => 83
	i32 324831035, ; 61: ja/System.ServiceModel.NetFramingBase.resources.dll => 0x135c873b => 354
	i32 336156722, ; 62: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 304
	i32 342366114, ; 63: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 242
	i32 356389973, ; 64: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 303
	i32 360082299, ; 65: System.ServiceModel.Web => 0x15766b7b => 131
	i32 361065771, ; 66: cs/System.ServiceModel.NetTcp.resources.dll => 0x15856d2b => 375
	i32 367780167, ; 67: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 68: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 69: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 70: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 71: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 72: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 73: _Microsoft.Android.Resource.Designer => 0x17969339 => 404
	i32 403441872, ; 74: WindowsBase => 0x180c08d0 => 165
	i32 420389340, ; 75: es\System.ServiceModel.NetNamedPipe.resources => 0x190ea1dc => 364
	i32 435591531, ; 76: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 315
	i32 441335492, ; 77: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 225
	i32 442565967, ; 78: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 79: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 238
	i32 451504562, ; 80: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456096849, ; 81: zh-Hans/System.ServiceModel.Primitives.resources.dll => 0x1b2f7c51 => 399
	i32 456227837, ; 82: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 83: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 84: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 85: System.dll => 0x1bff388e => 164
	i32 470570628, ; 86: TaskyAndroid.dll => 0x1c0c5684 => 0
	i32 476646585, ; 87: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 240
	i32 482736244, ; 88: fr/System.ServiceModel.NetNamedPipe.resources.dll => 0x1cc5f874 => 365
	i32 486930444, ; 89: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 253
	i32 498788369, ; 90: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 91: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 302
	i32 500534657, ; 92: tr/System.ServiceModel.Http.resources.dll => 0x1dd58d81 => 346
	i32 503918385, ; 93: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 296
	i32 513247710, ; 94: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 183
	i32 520748051, ; 95: ja\System.ServiceModel.NetTcp.resources => 0x1f09fc13 => 380
	i32 525250519, ; 96: de/System.ServiceModel.NetTcp.resources.dll => 0x1f4eafd7 => 376
	i32 526420162, ; 97: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 98: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 285
	i32 530272170, ; 99: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 531014212, ; 100: ja\System.ServiceModel.Primitives.resources => 0x1fa6a244 => 393
	i32 535122277, ; 101: tr/System.ServiceModel.NetNamedPipe.resources.dll => 0x1fe55165 => 372
	i32 539058512, ; 102: Microsoft.Extensions.Logging => 0x20216150 => 178
	i32 540030774, ; 103: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 104: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 105: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 106: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 107: Jsr305Binding => 0x213954e7 => 278
	i32 562488221, ; 108: System.ServiceModel => 0x2186e39d => 205
	i32 569334933, ; 109: tr/System.ServiceModel.Federation.resources.dll => 0x21ef5c95 => 333
	i32 569601784, ; 110: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 276
	i32 577335427, ; 111: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 580569086, ; 112: zh-Hans\System.ServiceModel.NetTcp.resources => 0x229ac7fe => 386
	i32 592146354, ; 113: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 310
	i32 601371474, ; 114: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 115: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 116: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 625044127, ; 117: es/System.ServiceModel.NetTcp.resources.dll => 0x25416a9f => 377
	i32 627609679, ; 118: Xamarin.AndroidX.CustomView => 0x2568904f => 230
	i32 627931235, ; 119: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 308
	i32 634015394, ; 120: tr\System.ServiceModel.Primitives.resources => 0x25ca4ea2 => 398
	i32 635078218, ; 121: de\System.ServiceModel.Primitives.resources => 0x25da864a => 389
	i32 639843206, ; 122: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 236
	i32 643868501, ; 123: System.Net => 0x2660a755 => 81
	i32 643983915, ; 124: System.ServiceModel.Security => 0x26626a2b => 204
	i32 648503046, ; 125: de\System.ServiceModel.Federation.resources => 0x26a75f06 => 324
	i32 662205335, ; 126: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 127: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 272
	i32 666292255, ; 128: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 217
	i32 672442732, ; 129: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 130: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 131: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 290
	i32 690569205, ; 132: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 133: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 287
	i32 693804605, ; 134: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 135: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700069175, ; 136: cs/System.ServiceModel.NetNamedPipe.resources.dll => 0x29ba3537 => 362
	i32 700284507, ; 137: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 282
	i32 700358131, ; 138: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 139: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 305
	i32 709152836, ; 140: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 195
	i32 709557578, ; 141: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 293
	i32 710880553, ; 142: fr/System.ServiceModel.Primitives.resources.dll => 0x2a5f2d29 => 391
	i32 720511267, ; 143: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 286
	i32 722857257, ; 144: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 145: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 146: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 147: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 207
	i32 759454413, ; 148: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 149: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 767064363, ; 150: it/System.ServiceModel.NetNamedPipe.resources.dll => 0x2db8792b => 366
	i32 775507847, ; 151: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 152: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 314
	i32 789151979, ; 153: Microsoft.Extensions.Options => 0x2f0980eb => 182
	i32 790371945, ; 154: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 231
	i32 804715423, ; 155: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 156: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 245
	i32 823281589, ; 157: System.Private.Uri.dll => 0x311247b5 => 86
	i32 823444754, ; 158: zh-Hant\System.ServiceModel.Http.resources => 0x3114c512 => 348
	i32 828535308, ; 159: System.ServiceModel.NetNamedPipe => 0x3162720c => 200
	i32 830298997, ; 160: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 161: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 162: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 163: Xamarin.AndroidX.Print => 0x3246f6cd => 258
	i32 852919649, ; 164: pt-BR/System.ServiceModel.Primitives.resources.dll => 0x32d68561 => 396
	i32 873119928, ; 165: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 166: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 167: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 168: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 169: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 170: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 317
	i32 928116545, ; 171: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 281
	i32 952186615, ; 172: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 173: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 286
	i32 959135198, ; 174: fr/System.ServiceModel.NetFramingBase.resources.dll => 0x392b3dde => 352
	i32 966729478, ; 175: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 279
	i32 967690846, ; 176: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 242
	i32 972805734, ; 177: System.ServiceModel.Http => 0x39fbd666 => 198
	i32 975236339, ; 178: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 179: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 980852653, ; 180: pl\System.ServiceModel.Federation.resources => 0x3a769fad => 330
	i32 986514023, ; 181: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 182: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 183: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 184: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 185: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 186: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 262
	i32 1019214401, ; 187: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 188: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 177
	i32 1029334545, ; 189: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 292
	i32 1031528504, ; 190: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 280
	i32 1033084130, ; 191: cs/System.ServiceModel.NetFramingBase.resources.dll => 0x3d939ce2 => 349
	i32 1035644815, ; 192: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 215
	i32 1036536393, ; 193: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 194: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1047490775, ; 195: ru/System.ServiceModel.Http.resources.dll => 0x3e6f70d7 => 345
	i32 1052210849, ; 196: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 249
	i32 1067306892, ; 197: GoogleGson => 0x3f9dcf8c => 173
	i32 1081414353, ; 198: System.ServiceModel.Http.dll => 0x407512d1 => 198
	i32 1082857460, ; 199: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 200: Xamarin.Kotlin.StdLib => 0x409e66d8 => 283
	i32 1095172895, ; 201: it/System.ServiceModel.NetTcp.resources.dll => 0x4147031f => 379
	i32 1098259244, ; 202: System => 0x41761b2c => 164
	i32 1117830343, ; 203: ru/System.ServiceModel.Federation.resources.dll => 0x42a0bcc7 => 332
	i32 1118262833, ; 204: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 305
	i32 1121599056, ; 205: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 248
	i32 1127624469, ; 206: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 180
	i32 1131748925, ; 207: ru\System.ServiceModel.Http.resources => 0x43751e3d => 345
	i32 1137475283, ; 208: fr\System.ServiceModel.Federation.resources => 0x43cc7ed3 => 326
	i32 1142243660, ; 209: zh-Hant/System.ServiceModel.Http.resources.dll => 0x4415414c => 348
	i32 1149092582, ; 210: Xamarin.AndroidX.Window => 0x447dc2e6 => 275
	i32 1168523401, ; 211: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 311
	i32 1170634674, ; 212: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 213: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 271
	i32 1178241025, ; 214: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 256
	i32 1203215381, ; 215: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 309
	i32 1204270330, ; 216: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 217
	i32 1205230995, ; 217: it/System.ServiceModel.Http.resources.dll => 0x47d65d93 => 340
	i32 1207862497, ; 218: System.ServiceModel.NetTcp.dll => 0x47fe84e1 => 201
	i32 1208641965, ; 219: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 220: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 221: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 307
	i32 1243150071, ; 222: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 276
	i32 1253011324, ; 223: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 224: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 291
	i32 1264511973, ; 225: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 266
	i32 1267360935, ; 226: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 270
	i32 1273260888, ; 227: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 222
	i32 1275534314, ; 228: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 287
	i32 1278448581, ; 229: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 214
	i32 1293217323, ; 230: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 233
	i32 1296184643, ; 231: pl\System.ServiceModel.NetFramingBase.resources => 0x4d423543 => 356
	i32 1307310235, ; 232: pl/System.ServiceModel.Http.resources.dll => 0x4debf89b => 343
	i32 1309188875, ; 233: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1314523075, ; 234: fr/System.ServiceModel.NetTcp.resources.dll => 0x4e5a07c3 => 378
	i32 1322716291, ; 235: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 275
	i32 1324164729, ; 236: System.Linq => 0x4eed2679 => 61
	i32 1324212547, ; 237: pt-BR\System.ServiceModel.NetTcp.resources => 0x4eede143 => 383
	i32 1335329327, ; 238: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1360479413, ; 239: it\System.ServiceModel.Federation.resources => 0x511744b5 => 327
	i32 1361525254, ; 240: ru\System.ServiceModel.NetNamedPipe.resources => 0x51273a06 => 371
	i32 1364015309, ; 241: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 242: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 321
	i32 1376866003, ; 243: Xamarin.AndroidX.SavedState => 0x52114ed3 => 262
	i32 1379779777, ; 244: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1394641819, ; 245: System.ServiceModel.Primitives => 0x53208b9b => 203
	i32 1397695725, ; 246: Microsoft.IdentityModel.Xml => 0x534f24ed => 188
	i32 1402170036, ; 247: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 248: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 226
	i32 1408764838, ; 249: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 250: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 251: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1423907884, ; 252: zh-Hant/System.ServiceModel.Primitives.resources.dll => 0x54df1c2c => 400
	i32 1430672901, ; 253: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 289
	i32 1430830959, ; 254: zh-Hant\System.ServiceModel.NetFramingBase.resources => 0x5548bf6f => 361
	i32 1434145427, ; 255: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 256: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 279
	i32 1439761251, ; 257: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1442844750, ; 258: cs/System.ServiceModel.Primitives.resources.dll => 0x5600104e => 388
	i32 1452070440, ; 259: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 260: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 261: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 262: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 263: es\Microsoft.Maui.Controls.resources => 0x57152abe => 295
	i32 1461234159, ; 264: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 265: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 266: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 267: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 216
	i32 1470490898, ; 268: Microsoft.Extensions.Primitives => 0x57a5e912 => 183
	i32 1479771757, ; 269: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 270: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 271: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 272: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 263
	i32 1493001747, ; 273: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 299
	i32 1496356098, ; 274: pt-BR\System.ServiceModel.NetFramingBase.resources => 0x59309502 => 357
	i32 1514721132, ; 275: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 294
	i32 1536373174, ; 276: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 277: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 278: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 279: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 280: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 314
	i32 1552155078, ; 281: System.ServiceModel.NetFramingBase => 0x5c8401c6 => 199
	i32 1565862583, ; 282: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 283: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 284: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 285: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 286: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 232
	i32 1590860858, ; 287: System.ServiceModel.NetTcp => 0x5ed29c3a => 201
	i32 1592978981, ; 288: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 289: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 280
	i32 1601112923, ; 290: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 291: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 401
	i32 1604827217, ; 292: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 293: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 294: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 252
	i32 1622358360, ; 295: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 296: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 274
	i32 1626255391, ; 297: Microsoft.IdentityModel.Protocols.WsTrust => 0x60eeb01f => 185
	i32 1628529952, ; 298: pt-BR/System.ServiceModel.Http.resources.dll => 0x61116520 => 344
	i32 1629788937, ; 299: cs\System.ServiceModel.Primitives.resources => 0x61249b09 => 388
	i32 1635184631, ; 300: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 236
	i32 1636350590, ; 301: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 229
	i32 1639515021, ; 302: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 303: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 304: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1656530436, ; 305: ja/System.ServiceModel.NetNamedPipe.resources.dll => 0x62bca604 => 367
	i32 1657153582, ; 306: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 307: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 268
	i32 1658251792, ; 308: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 277
	i32 1661950287, ; 309: ru/System.ServiceModel.NetNamedPipe.resources.dll => 0x630f594f => 371
	i32 1670060433, ; 310: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 224
	i32 1675553242, ; 311: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 312: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 313: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 314: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 315: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 316: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 317: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 284
	i32 1701541528, ; 318: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1717748983, ; 319: ko/System.ServiceModel.Federation.resources.dll => 0x6662c4f7 => 329
	i32 1720223769, ; 320: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 245
	i32 1726116996, ; 321: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 322: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 323: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 220
	i32 1736233607, ; 324: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 312
	i32 1743415430, ; 325: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 290
	i32 1744735666, ; 326: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 327: Mono.Android.Export => 0x6816ab6a => 169
	i32 1749969296, ; 328: it/System.ServiceModel.Federation.resources.dll => 0x684e6990 => 327
	i32 1750313021, ; 329: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 330: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 331: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 332: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 333: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 267
	i32 1770582343, ; 334: Microsoft.Extensions.Logging.dll => 0x6988f147 => 178
	i32 1775568156, ; 335: de/System.ServiceModel.Primitives.resources.dll => 0x69d5051c => 389
	i32 1776026572, ; 336: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 337: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 338: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 339: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 306
	i32 1787719884, ; 340: tr/System.ServiceModel.NetFramingBase.resources.dll => 0x6a8e70cc => 359
	i32 1788241197, ; 341: Xamarin.AndroidX.Fragment => 0x6a96652d => 238
	i32 1792213857, ; 342: ru\System.ServiceModel.Federation.resources => 0x6ad30361 => 332
	i32 1793755602, ; 343: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 298
	i32 1808609942, ; 344: Xamarin.AndroidX.Loader => 0x6bcd3296 => 252
	i32 1813058853, ; 345: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 283
	i32 1813201214, ; 346: Xamarin.Google.Android.Material => 0x6c13413e => 277
	i32 1818569960, ; 347: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 257
	i32 1818787751, ; 348: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 349: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 350: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827118058, ; 351: pl\System.ServiceModel.NetNamedPipe.resources => 0x6ce79bea => 369
	i32 1827303595, ; 352: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 403
	i32 1828688058, ; 353: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 179
	i32 1834522491, ; 354: pt-BR\System.ServiceModel.Http.resources => 0x6d58977b => 344
	i32 1842015223, ; 355: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 318
	i32 1847515442, ; 356: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 207
	i32 1852096909, ; 357: tr/System.ServiceModel.NetTcp.resources.dll => 0x6e64c18d => 385
	i32 1853025655, ; 358: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 315
	i32 1858542181, ; 359: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870090363, ; 360: ko/System.ServiceModel.NetNamedPipe.resources.dll => 0x6f77507b => 368
	i32 1870277092, ; 361: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 362: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 297
	i32 1879696579, ; 363: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1882505209, ; 364: tr/System.ServiceModel.Primitives.resources.dll => 0x7034bff9 => 398
	i32 1885316902, ; 365: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 218
	i32 1885918049, ; 366: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 403
	i32 1888955245, ; 367: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 368: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 369: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 370: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 371: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1922109462, ; 372: System.ServiceModel.Primitives.dll => 0x72911016 => 203
	i32 1932085498, ; 373: fr\System.ServiceModel.Primitives.resources => 0x732948fa => 391
	i32 1939592360, ; 374: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1946106882, ; 375: es\System.ServiceModel.NetFramingBase.resources => 0x73ff3c02 => 351
	i32 1954170934, ; 376: fr/System.ServiceModel.Federation.resources.dll => 0x747a4836 => 326
	i32 1956758971, ; 377: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1960645073, ; 378: ko\System.ServiceModel.NetTcp.resources => 0x74dd11d1 => 381
	i32 1961813231, ; 379: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 264
	i32 1968388702, ; 380: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 174
	i32 1973329537, ; 381: ru/System.ServiceModel.NetFramingBase.resources.dll => 0x759e9e81 => 358
	i32 1983156543, ; 382: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 284
	i32 1985761444, ; 383: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 209
	i32 1986222447, ; 384: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 186
	i32 1999793157, ; 385: ja/System.ServiceModel.NetTcp.resources.dll => 0x77326c05 => 380
	i32 2003115576, ; 386: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 294
	i32 2011961780, ; 387: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 388: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 249
	i32 2025202353, ; 389: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 289
	i32 2031763787, ; 390: Xamarin.Android.Glide => 0x791a414b => 206
	i32 2045470958, ; 391: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 392: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 244
	i32 2060060697, ; 393: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 394: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 293
	i32 2070888862, ; 395: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2078280433, ; 396: zh-Hans/System.ServiceModel.NetFramingBase.resources.dll => 0x7be00af1 => 360
	i32 2079903147, ; 397: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2085039813, ; 398: System.Security.Cryptography.Xml.dll => 0x7c472ec5 => 196
	i32 2086675053, ; 399: System.ServiceModel.NetFramingBase.dll => 0x7c60226d => 199
	i32 2090596640, ; 400: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2092919810, ; 401: System.ServiceModel.dll => 0x7cbf6c02 => 205
	i32 2093814594, ; 402: Microsoft.IdentityModel.Tokens.Saml.dll => 0x7ccd1342 => 187
	i32 2098812199, ; 403: de/System.ServiceModel.Http.resources.dll => 0x7d195527 => 337
	i32 2118004960, ; 404: fr\System.ServiceModel.NetNamedPipe.resources => 0x7e3e30e0 => 365
	i32 2127167465, ; 405: System.Console => 0x7ec9ffe9 => 20
	i32 2132115774, ; 406: zh-Hant/System.ServiceModel.NetFramingBase.resources.dll => 0x7f15813e => 361
	i32 2142473426, ; 407: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 408: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 409: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 410: Microsoft.Maui => 0x80bd55ad => 192
	i32 2169148018, ; 411: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 301
	i32 2181898931, ; 412: Microsoft.Extensions.Options.dll => 0x820d22b3 => 182
	i32 2192057212, ; 413: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 179
	i32 2193016926, ; 414: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 415: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 288
	i32 2201231467, ; 416: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 417: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 181
	i32 2207618523, ; 418: it\Microsoft.Maui.Controls.resources => 0x839595db => 303
	i32 2217644978, ; 419: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 271
	i32 2222056684, ; 420: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2223829768, ; 421: ko/System.ServiceModel.Primitives.resources.dll => 0x848cf308 => 394
	i32 2224792570, ; 422: zh-Hant/System.ServiceModel.NetTcp.resources.dll => 0x849ba3fa => 387
	i32 2227276228, ; 423: cs\System.ServiceModel.NetFramingBase.resources => 0x84c189c4 => 349
	i32 2244775296, ; 424: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 253
	i32 2252106437, ; 425: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 426: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 427: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 428: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 175
	i32 2267999099, ; 429: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 208
	i32 2270573516, ; 430: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 297
	i32 2279755925, ; 431: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 260
	i32 2292263403, ; 432: zh-Hant\System.ServiceModel.Primitives.resources => 0x88a129eb => 400
	i32 2293034957, ; 433: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2294984242, ; 434: pl/System.ServiceModel.NetFramingBase.resources.dll => 0x88caae32 => 356
	i32 2295906218, ; 435: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 436: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 437: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 307
	i32 2305521784, ; 438: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2306840234, ; 439: cs\System.ServiceModel.Federation.resources => 0x897f96aa => 323
	i32 2315684594, ; 440: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 212
	i32 2320631194, ; 441: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2333576127, ; 442: pt-BR/System.ServiceModel.NetTcp.resources.dll => 0x8b178bbf => 383
	i32 2340441535, ; 443: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 444: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2348932370, ; 445: Microsoft.IdentityModel.Tokens.Saml => 0x8c01dd12 => 187
	i32 2353062107, ; 446: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 447: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 448: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 184
	i32 2371007202, ; 449: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 174
	i32 2378619854, ; 450: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 451: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2393708825, ; 452: es\System.ServiceModel.Http.resources => 0x8ead1919 => 338
	i32 2395872292, ; 453: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 302
	i32 2401565422, ; 454: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 455: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 235
	i32 2409983638, ; 456: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 402
	i32 2421380589, ; 457: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 458: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 222
	i32 2427813419, ; 459: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 299
	i32 2435356389, ; 460: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 461: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 462: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2454894271, ; 463: pl/System.ServiceModel.NetTcp.resources.dll => 0x9252b6bf => 382
	i32 2458678730, ; 464: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 465: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 466: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 225
	i32 2466230705, ; 467: fr/System.ServiceModel.Http.resources.dll => 0x92ffb1b1 => 339
	i32 2471841756, ; 468: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 469: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 470: Microsoft.Maui.Controls => 0x93dba8a1 => 190
	i32 2483903535, ; 471: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 472: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 473: System.AppContext.dll => 0x94798bc5 => 6
	i32 2491939797, ; 474: pt-BR\System.ServiceModel.NetNamedPipe.resources => 0x9487fbd5 => 370
	i32 2501346920, ; 475: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503402960, ; 476: de\System.ServiceModel.NetFramingBase.resources => 0x9536e5d0 => 350
	i32 2505896520, ; 477: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 247
	i32 2522472828, ; 478: Xamarin.Android.Glide.dll => 0x9659e17c => 206
	i32 2538310050, ; 479: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2539621919, ; 480: es/System.ServiceModel.Federation.resources.dll => 0x975f8e1f => 325
	i32 2550873716, ; 481: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 300
	i32 2562349572, ; 482: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 483: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2574359397, ; 484: tr\System.ServiceModel.NetFramingBase.resources => 0x99719b65 => 359
	i32 2577645437, ; 485: ko/System.ServiceModel.NetFramingBase.resources.dll => 0x99a3bf7d => 355
	i32 2581783588, ; 486: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 248
	i32 2581819634, ; 487: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 270
	i32 2585220780, ; 488: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 489: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 490: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2591523840, ; 491: it/System.ServiceModel.Primitives.resources.dll => 0x9a778400 => 392
	i32 2593496499, ; 492: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 309
	i32 2605712449, ; 493: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 288
	i32 2615233544, ; 494: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 239
	i32 2616218305, ; 495: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 180
	i32 2617129537, ; 496: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 497: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 498: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 229
	i32 2624644809, ; 499: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 234
	i32 2626831493, ; 500: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 304
	i32 2627185994, ; 501: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 502: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 503: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 243
	i32 2640290731, ; 504: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 184
	i32 2654295266, ; 505: ru/System.ServiceModel.NetTcp.resources.dll => 0x9e3554e2 => 384
	i32 2659772221, ; 506: es\System.ServiceModel.Federation.resources => 0x9e88e73d => 325
	i32 2663391936, ; 507: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 208
	i32 2663698177, ; 508: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 509: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 510: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 511: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 512: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 513: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 514: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 268
	i32 2705927368, ; 515: zh-Hant/System.ServiceModel.Federation.resources.dll => 0xa1492cc8 => 335
	i32 2712765783, ; 516: pl/System.ServiceModel.Primitives.resources.dll => 0xa1b18557 => 395
	i32 2715334215, ; 517: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 518: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 519: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 520: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2724977475, ; 521: pt-BR/System.ServiceModel.Federation.resources.dll => 0xa26bdb43 => 331
	i32 2732626843, ; 522: Xamarin.AndroidX.Activity => 0xa2e0939b => 210
	i32 2735172069, ; 523: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 524: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 216
	i32 2740877318, ; 525: it\System.ServiceModel.NetTcp.resources => 0xa35e7806 => 379
	i32 2740948882, ; 526: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2742465751, ; 527: zh-Hans/System.ServiceModel.NetTcp.resources.dll => 0xa376b4d7 => 386
	i32 2748088231, ; 528: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 529: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 310
	i32 2753493119, ; 530: System.ServiceModel.Security.dll => 0xa41ef87f => 204
	i32 2756478476, ; 531: zh-Hant\System.ServiceModel.NetTcp.resources => 0xa44c860c => 387
	i32 2758225723, ; 532: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 191
	i32 2764765095, ; 533: Microsoft.Maui.dll => 0xa4caf7a7 => 192
	i32 2765824710, ; 534: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 535: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 282
	i32 2778768386, ; 536: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 273
	i32 2779977773, ; 537: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 261
	i32 2780661947, ; 538: pl/System.ServiceModel.NetNamedPipe.resources.dll => 0xa5bd88bb => 369
	i32 2785988530, ; 539: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 316
	i32 2788224221, ; 540: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 239
	i32 2801831435, ; 541: Microsoft.Maui.Graphics => 0xa7008e0b => 194
	i32 2803228030, ; 542: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 543: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 295
	i32 2810250172, ; 544: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 226
	i32 2819470561, ; 545: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 546: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 547: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 261
	i32 2822016028, ; 548: zh-Hans/System.ServiceModel.NetNamedPipe.resources.dll => 0xa8348c1c => 373
	i32 2824502124, ; 549: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 550: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 308
	i32 2838993487, ; 551: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 250
	i32 2849599387, ; 552: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 553: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 273
	i32 2855708567, ; 554: Xamarin.AndroidX.Transition => 0xaa36a797 => 269
	i32 2861098320, ; 555: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 556: Microsoft.Maui.Essentials => 0xaa8a4878 => 193
	i32 2870099610, ; 557: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 211
	i32 2875164099, ; 558: Jsr305Binding.dll => 0xab5f85c3 => 278
	i32 2875220617, ; 559: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 560: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 237
	i32 2887636118, ; 561: System.Net.dll => 0xac1dd496 => 81
	i32 2899241291, ; 562: it\System.ServiceModel.Http.resources => 0xaccee94b => 340
	i32 2899753641, ; 563: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 564: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 565: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 566: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 567: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 568: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 274
	i32 2917500511, ; 569: zh-Hant/System.ServiceModel.NetNamedPipe.resources.dll => 0xade5865f => 374
	i32 2919462931, ; 570: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 571: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 213
	i32 2921417940, ; 572: System.Security.Cryptography.Xml => 0xae214cd4 => 196
	i32 2936416060, ; 573: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 574: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 575: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2958066338, ; 576: pl\System.ServiceModel.Primitives.resources => 0xb05082a2 => 395
	i32 2958246600, ; 577: de\System.ServiceModel.Http.resources => 0xb05342c8 => 337
	i32 2959614098, ; 578: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 579: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 580: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 581: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 233
	i32 2985026235, ; 582: ja\System.ServiceModel.NetNamedPipe.resources => 0xb1ebe2bb => 367
	i32 2987532451, ; 583: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 264
	i32 2996846495, ; 584: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 246
	i32 3016983068, ; 585: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 266
	i32 3022610030, ; 586: ja\System.ServiceModel.Http.resources => 0xb4295e6e => 341
	i32 3023353419, ; 587: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 588: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 241
	i32 3038032645, ; 589: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 404
	i32 3046511124, ; 590: es/System.ServiceModel.Primitives.resources.dll => 0xb5961214 => 390
	i32 3049900938, ; 591: pt-BR/System.ServiceModel.NetNamedPipe.resources.dll => 0xb5c9cb8a => 370
	i32 3056245963, ; 592: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 263
	i32 3057625584, ; 593: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 254
	i32 3059408633, ; 594: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 595: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 596: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 597: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 301
	i32 3084678329, ; 598: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 186
	i32 3090735792, ; 599: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 600: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 601: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 602: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 603: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3123044289, ; 604: System.ServiceModel.Duplex => 0xba25dfc1 => 202
	i32 3123119788, ; 605: Microsoft.IdentityModel.Protocols.WsTrust.dll => 0xba2706ac => 185
	i32 3124832203, ; 606: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 607: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 608: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 609: GoogleGson.dll => 0xbba64c02 => 173
	i32 3157052235, ; 610: System.ServiceModel.Federation.dll => 0xbc2ccb4b => 197
	i32 3159123045, ; 611: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3159587175, ; 612: cs/System.ServiceModel.Http.resources.dll => 0xbc537967 => 336
	i32 3160747431, ; 613: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 614: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 255
	i32 3184440510, ; 615: pt-BR\System.ServiceModel.Federation.resources => 0xbdceb4be => 331
	i32 3192346100, ; 616: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 617: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 618: System.Data.dll => 0xbefef58f => 24
	i32 3206733304, ; 619: ja/System.ServiceModel.Federation.resources.dll => 0xbf22ddf8 => 328
	i32 3209718065, ; 620: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 621: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 232
	i32 3220365878, ; 622: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 623: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3241028803, ; 624: it\System.ServiceModel.NetNamedPipe.resources => 0xc12e2cc3 => 366
	i32 3251039220, ; 625: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 626: Xamarin.AndroidX.CardView => 0xc235e84d => 220
	i32 3265493905, ; 627: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 628: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 629: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3278332997, ; 630: zh-Hans/System.ServiceModel.Http.resources.dll => 0xc3676445 => 347
	i32 3279906254, ; 631: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 632: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 633: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3291006565, ; 634: fr\System.ServiceModel.NetTcp.resources => 0xc428c665 => 378
	i32 3299363146, ; 635: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 636: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 637: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 296
	i32 3316684772, ; 638: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 639: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 230
	i32 3317144872, ; 640: System.Data => 0xc5b79d28 => 24
	i32 3340202976, ; 641: tr\System.ServiceModel.NetNamedPipe.resources => 0xc71773e0 => 372
	i32 3340431453, ; 642: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 218
	i32 3345895724, ; 643: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 259
	i32 3346324047, ; 644: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 256
	i32 3347128195, ; 645: tr\System.ServiceModel.Http.resources => 0xc7811f83 => 346
	i32 3357674450, ; 646: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 313
	i32 3358260929, ; 647: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 648: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 211
	i32 3362522851, ; 649: Xamarin.AndroidX.Core => 0xc86c06e3 => 227
	i32 3366347497, ; 650: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 651: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 260
	i32 3381016424, ; 652: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 292
	i32 3395150330, ; 653: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 654: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 655: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 231
	i32 3406727474, ; 656: zh-Hant\System.ServiceModel.Federation.resources => 0xcb0e8932 => 335
	i32 3428513518, ; 657: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 176
	i32 3429136800, ; 658: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 659: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 660: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 234
	i32 3445260447, ; 661: System.Formats.Tar => 0xcd5a809f => 39
	i32 3447165740, ; 662: ja/System.ServiceModel.Http.resources.dll => 0xcd77932c => 341
	i32 3450008806, ; 663: ja\System.ServiceModel.Federation.resources => 0xcda2f4e6 => 328
	i32 3452344032, ; 664: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 189
	i32 3453180490, ; 665: ko\System.ServiceModel.Primitives.resources => 0xcdd35a4a => 394
	i32 3463511458, ; 666: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 300
	i32 3471940407, ; 667: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 668: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 669: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 313
	i32 3482217531, ; 670: cs\System.ServiceModel.Http.resources => 0xcf8e6c3b => 336
	i32 3483609038, ; 671: es/System.ServiceModel.Http.resources.dll => 0xcfa3a7ce => 338
	i32 3484440000, ; 672: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 312
	i32 3485117614, ; 673: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 674: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 675: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 223
	i32 3509114376, ; 676: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 677: System.Security.dll => 0xd1854eb4 => 130
	i32 3521184679, ; 678: ru\System.ServiceModel.NetFramingBase.resources => 0xd1e103a7 => 358
	i32 3530912306, ; 679: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 680: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3548480101, ; 681: de/System.ServiceModel.Federation.resources.dll => 0xd3818265 => 324
	i32 3560100363, ; 682: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 683: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580333612, ; 684: zh-Hans\System.ServiceModel.Federation.resources => 0xd5678e2c => 334
	i32 3580758918, ; 685: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 320
	i32 3597029428, ; 686: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 209
	i32 3598340787, ; 687: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3605274052, ; 688: ja\System.ServiceModel.NetFramingBase.resources => 0xd6e41dc4 => 354
	i32 3605918211, ; 689: tr\System.ServiceModel.NetTcp.resources => 0xd6edf203 => 385
	i32 3608519521, ; 690: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 691: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 692: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 258
	i32 3632773286, ; 693: zh-Hans\System.ServiceModel.NetNamedPipe.resources => 0xd887b8a6 => 373
	i32 3633644679, ; 694: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 213
	i32 3638233600, ; 695: ru\System.ServiceModel.Primitives.resources => 0xd8db0a00 => 397
	i32 3638274909, ; 696: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 697: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 244
	i32 3641688426, ; 698: it/System.ServiceModel.NetFramingBase.resources.dll => 0xd90fc16a => 353
	i32 3643446276, ; 699: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 317
	i32 3643854240, ; 700: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 255
	i32 3645089577, ; 701: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 702: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 175
	i32 3660523487, ; 703: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3664118907, ; 704: pt-BR\System.ServiceModel.Primitives.resources => 0xda66047b => 396
	i32 3672681054, ; 705: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3675849680, ; 706: cs\System.ServiceModel.NetTcp.resources => 0xdb1903d0 => 375
	i32 3676670898, ; 707: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 401
	i32 3680281109, ; 708: ko/System.ServiceModel.Http.resources.dll => 0xdb5ca215 => 342
	i32 3682565725, ; 709: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 219
	i32 3684561358, ; 710: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 223
	i32 3685718856, ; 711: pl/System.ServiceModel.Federation.resources.dll => 0xdbaf9b48 => 330
	i32 3690488555, ; 712: pl\System.ServiceModel.NetTcp.resources => 0xdbf862eb => 382
	i32 3697841164, ; 713: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 322
	i32 3700619798, ; 714: pt-BR/System.ServiceModel.NetFramingBase.resources.dll => 0xdc92fa16 => 357
	i32 3700866549, ; 715: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3705132617, ; 716: it\System.ServiceModel.NetFramingBase.resources => 0xdcd7d649 => 353
	i32 3706696989, ; 717: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 228
	i32 3709546624, ; 718: ru\System.ServiceModel.NetTcp.resources => 0xdd1b3080 => 384
	i32 3716563718, ; 719: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 720: Xamarin.AndroidX.Annotation => 0xdda814c6 => 212
	i32 3724971120, ; 721: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 254
	i32 3732100267, ; 722: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 723: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3743991391, ; 724: de\System.ServiceModel.NetTcp.resources => 0xdf28c65f => 376
	i32 3748608112, ; 725: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 726: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3765508441, ; 727: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 181
	i32 3786282454, ; 728: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 221
	i32 3792276235, ; 729: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 730: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 189
	i32 3802395368, ; 731: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3807198597, ; 732: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 195
	i32 3813989096, ; 733: ko\System.ServiceModel.NetFramingBase.resources => 0xe354dae8 => 355
	i32 3819260425, ; 734: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 735: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 736: System.Numerics.dll => 0xe4436460 => 83
	i32 3831382396, ; 737: es\System.ServiceModel.Primitives.resources => 0xe45e417c => 390
	i32 3836405899, ; 738: cs/System.ServiceModel.Federation.resources.dll => 0xe4aae88b => 323
	i32 3841636137, ; 739: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 177
	i32 3844307129, ; 740: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 741: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 742: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 743: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 744: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876601672, ; 745: zh-Hans\System.ServiceModel.NetFramingBase.resources => 0xe7103f48 => 360
	i32 3885497537, ; 746: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 747: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 269
	i32 3888767677, ; 748: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 259
	i32 3889960447, ; 749: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 321
	i32 3896106733, ; 750: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 751: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 227
	i32 3901907137, ; 752: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3917319797, ; 753: System.ServiceModel.Federation => 0xe97d8e75 => 197
	i32 3920810846, ; 754: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 755: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 272
	i32 3928044579, ; 756: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 757: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 758: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 257
	i32 3945713374, ; 759: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3948719759, ; 760: es/System.ServiceModel.NetFramingBase.resources.dll => 0xeb5cae8f => 351
	i32 3953953790, ; 761: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 762: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 215
	i32 3959773229, ; 763: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 246
	i32 3971291721, ; 764: System.ServiceModel.NetNamedPipe.dll => 0xecb51a49 => 200
	i32 3980434154, ; 765: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 316
	i32 3987592930, ; 766: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 298
	i32 4003436829, ; 767: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 768: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 214
	i32 4025784931, ; 769: System.Memory => 0xeff49a63 => 62
	i32 4043772061, ; 770: zh-Hans/System.ServiceModel.Federation.resources.dll => 0xf107109d => 334
	i32 4046471985, ; 771: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 191
	i32 4054681211, ; 772: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 773: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 774: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4081805871, ; 775: zh-Hans\System.ServiceModel.Primitives.resources => 0xf34b6a2f => 399
	i32 4094352644, ; 776: Microsoft.Maui.Essentials.dll => 0xf40add04 => 193
	i32 4099507663, ; 777: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 778: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 779: Xamarin.AndroidX.Emoji2 => 0xf479582c => 235
	i32 4102112229, ; 780: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 311
	i32 4120300202, ; 781: de/System.ServiceModel.NetNamedPipe.resources.dll => 0xf596caaa => 363
	i32 4125707920, ; 782: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 306
	i32 4126470640, ; 783: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 176
	i32 4127667938, ; 784: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 785: System.AppContext => 0xf6318da0 => 6
	i32 4137271634, ; 786: Microsoft.IdentityModel.Xml.dll => 0xf699c152 => 188
	i32 4147710070, ; 787: ko\System.ServiceModel.NetNamedPipe.resources => 0xf7390876 => 368
	i32 4147896353, ; 788: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 789: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 318
	i32 4151237749, ; 790: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 791: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 792: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 793: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 794: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 795: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 251
	i32 4182880526, ; 796: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 402
	i32 4185676441, ; 797: System.Security => 0xf97c5a99 => 130
	i32 4195421176, ; 798: TaskyAndroid => 0xfa110bf8 => 0
	i32 4196529839, ; 799: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 800: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 801: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 228
	i32 4258378803, ; 802: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 250
	i32 4260525087, ; 803: System.Buffers => 0xfdf2741f => 7
	i32 4261754524, ; 804: ko\System.ServiceModel.Http.resources => 0xfe05369c => 342
	i32 4266814471, ; 805: zh-Hant\System.ServiceModel.NetNamedPipe.resources => 0xfe526c07 => 374
	i32 4271975918, ; 806: Microsoft.Maui.Controls.dll => 0xfea12dee => 190
	i32 4274976490, ; 807: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 808: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 251
	i32 4294763496 ; 809: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 237
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [810 x i32] [
	i32 68, ; 0
	i32 352, ; 1
	i32 67, ; 2
	i32 108, ; 3
	i32 377, ; 4
	i32 333, ; 5
	i32 247, ; 6
	i32 281, ; 7
	i32 48, ; 8
	i32 80, ; 9
	i32 145, ; 10
	i32 202, ; 11
	i32 30, ; 12
	i32 322, ; 13
	i32 124, ; 14
	i32 362, ; 15
	i32 194, ; 16
	i32 102, ; 17
	i32 393, ; 18
	i32 265, ; 19
	i32 107, ; 20
	i32 265, ; 21
	i32 139, ; 22
	i32 285, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 221, ; 27
	i32 350, ; 28
	i32 132, ; 29
	i32 267, ; 30
	i32 151, ; 31
	i32 339, ; 32
	i32 363, ; 33
	i32 319, ; 34
	i32 320, ; 35
	i32 18, ; 36
	i32 219, ; 37
	i32 329, ; 38
	i32 26, ; 39
	i32 241, ; 40
	i32 1, ; 41
	i32 397, ; 42
	i32 59, ; 43
	i32 42, ; 44
	i32 91, ; 45
	i32 364, ; 46
	i32 224, ; 47
	i32 147, ; 48
	i32 243, ; 49
	i32 240, ; 50
	i32 291, ; 51
	i32 392, ; 52
	i32 54, ; 53
	i32 347, ; 54
	i32 69, ; 55
	i32 343, ; 56
	i32 319, ; 57
	i32 210, ; 58
	i32 381, ; 59
	i32 83, ; 60
	i32 354, ; 61
	i32 304, ; 62
	i32 242, ; 63
	i32 303, ; 64
	i32 131, ; 65
	i32 375, ; 66
	i32 55, ; 67
	i32 149, ; 68
	i32 74, ; 69
	i32 145, ; 70
	i32 62, ; 71
	i32 146, ; 72
	i32 404, ; 73
	i32 165, ; 74
	i32 364, ; 75
	i32 315, ; 76
	i32 225, ; 77
	i32 12, ; 78
	i32 238, ; 79
	i32 125, ; 80
	i32 399, ; 81
	i32 152, ; 82
	i32 113, ; 83
	i32 166, ; 84
	i32 164, ; 85
	i32 0, ; 86
	i32 240, ; 87
	i32 365, ; 88
	i32 253, ; 89
	i32 84, ; 90
	i32 302, ; 91
	i32 346, ; 92
	i32 296, ; 93
	i32 183, ; 94
	i32 380, ; 95
	i32 376, ; 96
	i32 150, ; 97
	i32 285, ; 98
	i32 60, ; 99
	i32 393, ; 100
	i32 372, ; 101
	i32 178, ; 102
	i32 51, ; 103
	i32 103, ; 104
	i32 114, ; 105
	i32 40, ; 106
	i32 278, ; 107
	i32 205, ; 108
	i32 333, ; 109
	i32 276, ; 110
	i32 120, ; 111
	i32 386, ; 112
	i32 310, ; 113
	i32 52, ; 114
	i32 44, ; 115
	i32 119, ; 116
	i32 377, ; 117
	i32 230, ; 118
	i32 308, ; 119
	i32 398, ; 120
	i32 389, ; 121
	i32 236, ; 122
	i32 81, ; 123
	i32 204, ; 124
	i32 324, ; 125
	i32 136, ; 126
	i32 272, ; 127
	i32 217, ; 128
	i32 8, ; 129
	i32 73, ; 130
	i32 290, ; 131
	i32 155, ; 132
	i32 287, ; 133
	i32 154, ; 134
	i32 92, ; 135
	i32 362, ; 136
	i32 282, ; 137
	i32 45, ; 138
	i32 305, ; 139
	i32 195, ; 140
	i32 293, ; 141
	i32 391, ; 142
	i32 286, ; 143
	i32 109, ; 144
	i32 129, ; 145
	i32 25, ; 146
	i32 207, ; 147
	i32 72, ; 148
	i32 55, ; 149
	i32 366, ; 150
	i32 46, ; 151
	i32 314, ; 152
	i32 182, ; 153
	i32 231, ; 154
	i32 22, ; 155
	i32 245, ; 156
	i32 86, ; 157
	i32 348, ; 158
	i32 200, ; 159
	i32 43, ; 160
	i32 160, ; 161
	i32 71, ; 162
	i32 258, ; 163
	i32 396, ; 164
	i32 3, ; 165
	i32 42, ; 166
	i32 63, ; 167
	i32 16, ; 168
	i32 53, ; 169
	i32 317, ; 170
	i32 281, ; 171
	i32 105, ; 172
	i32 286, ; 173
	i32 352, ; 174
	i32 279, ; 175
	i32 242, ; 176
	i32 198, ; 177
	i32 34, ; 178
	i32 158, ; 179
	i32 330, ; 180
	i32 85, ; 181
	i32 32, ; 182
	i32 12, ; 183
	i32 51, ; 184
	i32 56, ; 185
	i32 262, ; 186
	i32 36, ; 187
	i32 177, ; 188
	i32 292, ; 189
	i32 280, ; 190
	i32 349, ; 191
	i32 215, ; 192
	i32 35, ; 193
	i32 58, ; 194
	i32 345, ; 195
	i32 249, ; 196
	i32 173, ; 197
	i32 198, ; 198
	i32 17, ; 199
	i32 283, ; 200
	i32 379, ; 201
	i32 164, ; 202
	i32 332, ; 203
	i32 305, ; 204
	i32 248, ; 205
	i32 180, ; 206
	i32 345, ; 207
	i32 326, ; 208
	i32 348, ; 209
	i32 275, ; 210
	i32 311, ; 211
	i32 153, ; 212
	i32 271, ; 213
	i32 256, ; 214
	i32 309, ; 215
	i32 217, ; 216
	i32 340, ; 217
	i32 201, ; 218
	i32 29, ; 219
	i32 52, ; 220
	i32 307, ; 221
	i32 276, ; 222
	i32 5, ; 223
	i32 291, ; 224
	i32 266, ; 225
	i32 270, ; 226
	i32 222, ; 227
	i32 287, ; 228
	i32 214, ; 229
	i32 233, ; 230
	i32 356, ; 231
	i32 343, ; 232
	i32 85, ; 233
	i32 378, ; 234
	i32 275, ; 235
	i32 61, ; 236
	i32 383, ; 237
	i32 112, ; 238
	i32 327, ; 239
	i32 371, ; 240
	i32 57, ; 241
	i32 321, ; 242
	i32 262, ; 243
	i32 99, ; 244
	i32 203, ; 245
	i32 188, ; 246
	i32 19, ; 247
	i32 226, ; 248
	i32 111, ; 249
	i32 101, ; 250
	i32 102, ; 251
	i32 400, ; 252
	i32 289, ; 253
	i32 361, ; 254
	i32 104, ; 255
	i32 279, ; 256
	i32 71, ; 257
	i32 388, ; 258
	i32 38, ; 259
	i32 32, ; 260
	i32 103, ; 261
	i32 73, ; 262
	i32 295, ; 263
	i32 9, ; 264
	i32 123, ; 265
	i32 46, ; 266
	i32 216, ; 267
	i32 183, ; 268
	i32 9, ; 269
	i32 43, ; 270
	i32 4, ; 271
	i32 263, ; 272
	i32 299, ; 273
	i32 357, ; 274
	i32 294, ; 275
	i32 31, ; 276
	i32 138, ; 277
	i32 92, ; 278
	i32 93, ; 279
	i32 314, ; 280
	i32 199, ; 281
	i32 49, ; 282
	i32 141, ; 283
	i32 112, ; 284
	i32 140, ; 285
	i32 232, ; 286
	i32 201, ; 287
	i32 115, ; 288
	i32 280, ; 289
	i32 157, ; 290
	i32 401, ; 291
	i32 76, ; 292
	i32 79, ; 293
	i32 252, ; 294
	i32 37, ; 295
	i32 274, ; 296
	i32 185, ; 297
	i32 344, ; 298
	i32 388, ; 299
	i32 236, ; 300
	i32 229, ; 301
	i32 64, ; 302
	i32 138, ; 303
	i32 15, ; 304
	i32 367, ; 305
	i32 116, ; 306
	i32 268, ; 307
	i32 277, ; 308
	i32 371, ; 309
	i32 224, ; 310
	i32 48, ; 311
	i32 70, ; 312
	i32 80, ; 313
	i32 126, ; 314
	i32 94, ; 315
	i32 121, ; 316
	i32 284, ; 317
	i32 26, ; 318
	i32 329, ; 319
	i32 245, ; 320
	i32 97, ; 321
	i32 28, ; 322
	i32 220, ; 323
	i32 312, ; 324
	i32 290, ; 325
	i32 149, ; 326
	i32 169, ; 327
	i32 327, ; 328
	i32 4, ; 329
	i32 98, ; 330
	i32 33, ; 331
	i32 93, ; 332
	i32 267, ; 333
	i32 178, ; 334
	i32 389, ; 335
	i32 21, ; 336
	i32 41, ; 337
	i32 170, ; 338
	i32 306, ; 339
	i32 359, ; 340
	i32 238, ; 341
	i32 332, ; 342
	i32 298, ; 343
	i32 252, ; 344
	i32 283, ; 345
	i32 277, ; 346
	i32 257, ; 347
	i32 2, ; 348
	i32 134, ; 349
	i32 111, ; 350
	i32 369, ; 351
	i32 403, ; 352
	i32 179, ; 353
	i32 344, ; 354
	i32 318, ; 355
	i32 207, ; 356
	i32 385, ; 357
	i32 315, ; 358
	i32 58, ; 359
	i32 368, ; 360
	i32 95, ; 361
	i32 297, ; 362
	i32 39, ; 363
	i32 398, ; 364
	i32 218, ; 365
	i32 403, ; 366
	i32 25, ; 367
	i32 94, ; 368
	i32 89, ; 369
	i32 99, ; 370
	i32 10, ; 371
	i32 203, ; 372
	i32 391, ; 373
	i32 87, ; 374
	i32 351, ; 375
	i32 326, ; 376
	i32 100, ; 377
	i32 381, ; 378
	i32 264, ; 379
	i32 174, ; 380
	i32 358, ; 381
	i32 284, ; 382
	i32 209, ; 383
	i32 186, ; 384
	i32 380, ; 385
	i32 294, ; 386
	i32 7, ; 387
	i32 249, ; 388
	i32 289, ; 389
	i32 206, ; 390
	i32 88, ; 391
	i32 244, ; 392
	i32 154, ; 393
	i32 293, ; 394
	i32 33, ; 395
	i32 360, ; 396
	i32 116, ; 397
	i32 196, ; 398
	i32 199, ; 399
	i32 82, ; 400
	i32 205, ; 401
	i32 187, ; 402
	i32 337, ; 403
	i32 365, ; 404
	i32 20, ; 405
	i32 361, ; 406
	i32 11, ; 407
	i32 162, ; 408
	i32 3, ; 409
	i32 192, ; 410
	i32 301, ; 411
	i32 182, ; 412
	i32 179, ; 413
	i32 84, ; 414
	i32 288, ; 415
	i32 64, ; 416
	i32 181, ; 417
	i32 303, ; 418
	i32 271, ; 419
	i32 143, ; 420
	i32 394, ; 421
	i32 387, ; 422
	i32 349, ; 423
	i32 253, ; 424
	i32 157, ; 425
	i32 41, ; 426
	i32 117, ; 427
	i32 175, ; 428
	i32 208, ; 429
	i32 297, ; 430
	i32 260, ; 431
	i32 400, ; 432
	i32 131, ; 433
	i32 356, ; 434
	i32 75, ; 435
	i32 66, ; 436
	i32 307, ; 437
	i32 172, ; 438
	i32 323, ; 439
	i32 212, ; 440
	i32 143, ; 441
	i32 383, ; 442
	i32 106, ; 443
	i32 151, ; 444
	i32 187, ; 445
	i32 70, ; 446
	i32 156, ; 447
	i32 184, ; 448
	i32 174, ; 449
	i32 121, ; 450
	i32 127, ; 451
	i32 338, ; 452
	i32 302, ; 453
	i32 152, ; 454
	i32 235, ; 455
	i32 402, ; 456
	i32 141, ; 457
	i32 222, ; 458
	i32 299, ; 459
	i32 20, ; 460
	i32 14, ; 461
	i32 135, ; 462
	i32 382, ; 463
	i32 75, ; 464
	i32 59, ; 465
	i32 225, ; 466
	i32 339, ; 467
	i32 167, ; 468
	i32 168, ; 469
	i32 190, ; 470
	i32 15, ; 471
	i32 74, ; 472
	i32 6, ; 473
	i32 370, ; 474
	i32 23, ; 475
	i32 350, ; 476
	i32 247, ; 477
	i32 206, ; 478
	i32 91, ; 479
	i32 325, ; 480
	i32 300, ; 481
	i32 1, ; 482
	i32 136, ; 483
	i32 359, ; 484
	i32 355, ; 485
	i32 248, ; 486
	i32 270, ; 487
	i32 134, ; 488
	i32 69, ; 489
	i32 146, ; 490
	i32 392, ; 491
	i32 309, ; 492
	i32 288, ; 493
	i32 239, ; 494
	i32 180, ; 495
	i32 88, ; 496
	i32 96, ; 497
	i32 229, ; 498
	i32 234, ; 499
	i32 304, ; 500
	i32 31, ; 501
	i32 45, ; 502
	i32 243, ; 503
	i32 184, ; 504
	i32 384, ; 505
	i32 325, ; 506
	i32 208, ; 507
	i32 109, ; 508
	i32 158, ; 509
	i32 35, ; 510
	i32 22, ; 511
	i32 114, ; 512
	i32 57, ; 513
	i32 268, ; 514
	i32 335, ; 515
	i32 395, ; 516
	i32 144, ; 517
	i32 118, ; 518
	i32 120, ; 519
	i32 110, ; 520
	i32 331, ; 521
	i32 210, ; 522
	i32 139, ; 523
	i32 216, ; 524
	i32 379, ; 525
	i32 54, ; 526
	i32 386, ; 527
	i32 105, ; 528
	i32 310, ; 529
	i32 204, ; 530
	i32 387, ; 531
	i32 191, ; 532
	i32 192, ; 533
	i32 133, ; 534
	i32 282, ; 535
	i32 273, ; 536
	i32 261, ; 537
	i32 369, ; 538
	i32 316, ; 539
	i32 239, ; 540
	i32 194, ; 541
	i32 159, ; 542
	i32 295, ; 543
	i32 226, ; 544
	i32 163, ; 545
	i32 132, ; 546
	i32 261, ; 547
	i32 373, ; 548
	i32 161, ; 549
	i32 308, ; 550
	i32 250, ; 551
	i32 140, ; 552
	i32 273, ; 553
	i32 269, ; 554
	i32 169, ; 555
	i32 193, ; 556
	i32 211, ; 557
	i32 278, ; 558
	i32 40, ; 559
	i32 237, ; 560
	i32 81, ; 561
	i32 340, ; 562
	i32 56, ; 563
	i32 37, ; 564
	i32 97, ; 565
	i32 166, ; 566
	i32 172, ; 567
	i32 274, ; 568
	i32 374, ; 569
	i32 82, ; 570
	i32 213, ; 571
	i32 196, ; 572
	i32 98, ; 573
	i32 30, ; 574
	i32 159, ; 575
	i32 395, ; 576
	i32 337, ; 577
	i32 18, ; 578
	i32 127, ; 579
	i32 119, ; 580
	i32 233, ; 581
	i32 367, ; 582
	i32 264, ; 583
	i32 246, ; 584
	i32 266, ; 585
	i32 341, ; 586
	i32 165, ; 587
	i32 241, ; 588
	i32 404, ; 589
	i32 390, ; 590
	i32 370, ; 591
	i32 263, ; 592
	i32 254, ; 593
	i32 170, ; 594
	i32 16, ; 595
	i32 144, ; 596
	i32 301, ; 597
	i32 186, ; 598
	i32 125, ; 599
	i32 118, ; 600
	i32 38, ; 601
	i32 115, ; 602
	i32 47, ; 603
	i32 202, ; 604
	i32 185, ; 605
	i32 142, ; 606
	i32 117, ; 607
	i32 34, ; 608
	i32 173, ; 609
	i32 197, ; 610
	i32 95, ; 611
	i32 336, ; 612
	i32 53, ; 613
	i32 255, ; 614
	i32 331, ; 615
	i32 129, ; 616
	i32 153, ; 617
	i32 24, ; 618
	i32 328, ; 619
	i32 161, ; 620
	i32 232, ; 621
	i32 148, ; 622
	i32 104, ; 623
	i32 366, ; 624
	i32 89, ; 625
	i32 220, ; 626
	i32 60, ; 627
	i32 142, ; 628
	i32 100, ; 629
	i32 347, ; 630
	i32 5, ; 631
	i32 13, ; 632
	i32 122, ; 633
	i32 378, ; 634
	i32 135, ; 635
	i32 28, ; 636
	i32 296, ; 637
	i32 72, ; 638
	i32 230, ; 639
	i32 24, ; 640
	i32 372, ; 641
	i32 218, ; 642
	i32 259, ; 643
	i32 256, ; 644
	i32 346, ; 645
	i32 313, ; 646
	i32 137, ; 647
	i32 211, ; 648
	i32 227, ; 649
	i32 168, ; 650
	i32 260, ; 651
	i32 292, ; 652
	i32 101, ; 653
	i32 123, ; 654
	i32 231, ; 655
	i32 335, ; 656
	i32 176, ; 657
	i32 163, ; 658
	i32 167, ; 659
	i32 234, ; 660
	i32 39, ; 661
	i32 341, ; 662
	i32 328, ; 663
	i32 189, ; 664
	i32 394, ; 665
	i32 300, ; 666
	i32 17, ; 667
	i32 171, ; 668
	i32 313, ; 669
	i32 336, ; 670
	i32 338, ; 671
	i32 312, ; 672
	i32 137, ; 673
	i32 150, ; 674
	i32 223, ; 675
	i32 155, ; 676
	i32 130, ; 677
	i32 358, ; 678
	i32 19, ; 679
	i32 65, ; 680
	i32 324, ; 681
	i32 147, ; 682
	i32 47, ; 683
	i32 334, ; 684
	i32 320, ; 685
	i32 209, ; 686
	i32 79, ; 687
	i32 354, ; 688
	i32 385, ; 689
	i32 61, ; 690
	i32 106, ; 691
	i32 258, ; 692
	i32 373, ; 693
	i32 213, ; 694
	i32 397, ; 695
	i32 49, ; 696
	i32 244, ; 697
	i32 353, ; 698
	i32 317, ; 699
	i32 255, ; 700
	i32 14, ; 701
	i32 175, ; 702
	i32 68, ; 703
	i32 396, ; 704
	i32 171, ; 705
	i32 375, ; 706
	i32 401, ; 707
	i32 342, ; 708
	i32 219, ; 709
	i32 223, ; 710
	i32 330, ; 711
	i32 382, ; 712
	i32 322, ; 713
	i32 357, ; 714
	i32 78, ; 715
	i32 353, ; 716
	i32 228, ; 717
	i32 384, ; 718
	i32 108, ; 719
	i32 212, ; 720
	i32 254, ; 721
	i32 67, ; 722
	i32 63, ; 723
	i32 376, ; 724
	i32 27, ; 725
	i32 160, ; 726
	i32 181, ; 727
	i32 221, ; 728
	i32 10, ; 729
	i32 189, ; 730
	i32 11, ; 731
	i32 195, ; 732
	i32 355, ; 733
	i32 78, ; 734
	i32 126, ; 735
	i32 83, ; 736
	i32 390, ; 737
	i32 323, ; 738
	i32 177, ; 739
	i32 66, ; 740
	i32 107, ; 741
	i32 65, ; 742
	i32 128, ; 743
	i32 122, ; 744
	i32 360, ; 745
	i32 77, ; 746
	i32 269, ; 747
	i32 259, ; 748
	i32 321, ; 749
	i32 8, ; 750
	i32 227, ; 751
	i32 2, ; 752
	i32 197, ; 753
	i32 44, ; 754
	i32 272, ; 755
	i32 156, ; 756
	i32 128, ; 757
	i32 257, ; 758
	i32 23, ; 759
	i32 351, ; 760
	i32 133, ; 761
	i32 215, ; 762
	i32 246, ; 763
	i32 200, ; 764
	i32 316, ; 765
	i32 298, ; 766
	i32 29, ; 767
	i32 214, ; 768
	i32 62, ; 769
	i32 334, ; 770
	i32 191, ; 771
	i32 90, ; 772
	i32 87, ; 773
	i32 148, ; 774
	i32 399, ; 775
	i32 193, ; 776
	i32 36, ; 777
	i32 86, ; 778
	i32 235, ; 779
	i32 311, ; 780
	i32 363, ; 781
	i32 306, ; 782
	i32 176, ; 783
	i32 50, ; 784
	i32 6, ; 785
	i32 188, ; 786
	i32 368, ; 787
	i32 90, ; 788
	i32 318, ; 789
	i32 21, ; 790
	i32 162, ; 791
	i32 96, ; 792
	i32 50, ; 793
	i32 113, ; 794
	i32 251, ; 795
	i32 402, ; 796
	i32 130, ; 797
	i32 0, ; 798
	i32 76, ; 799
	i32 27, ; 800
	i32 228, ; 801
	i32 250, ; 802
	i32 7, ; 803
	i32 342, ; 804
	i32 374, ; 805
	i32 190, ; 806
	i32 110, ; 807
	i32 251, ; 808
	i32 237 ; 809
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

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
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
