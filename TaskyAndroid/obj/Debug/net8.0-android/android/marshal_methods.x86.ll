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

@assembly_image_cache = dso_local local_unnamed_addr global [416 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [826 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 3921707, ; 1: fr\System.ServiceModel.NetFramingBase.resources => 0x3bd72b => 360
	i32 10166715, ; 2: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 3: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 17613696, ; 4: es\System.ServiceModel.NetTcp.resources => 0x10cc380 => 385
	i32 28923068, ; 5: tr\System.ServiceModel.Federation.resources => 0x1b954bc => 341
	i32 32687329, ; 6: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 256
	i32 34715100, ; 7: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 291
	i32 34839235, ; 8: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 40744412, ; 10: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 225
	i32 42639949, ; 11: System.Threading.Thread => 0x28aa24d => 145
	i32 53472207, ; 12: System.ServiceModel.Duplex.dll => 0x32febcf => 205
	i32 66541672, ; 13: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 14: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 330
	i32 68219467, ; 15: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 71084978, ; 16: cs\System.ServiceModel.NetNamedPipe.resources => 0x43cabb2 => 370
	i32 72070932, ; 17: Microsoft.Maui.Graphics.dll => 0x44bb714 => 197
	i32 82292897, ; 18: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 85813540, ; 19: ja/System.ServiceModel.Primitives.resources.dll => 0x51d6924 => 401
	i32 101534019, ; 20: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 274
	i32 117431740, ; 21: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 22: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 274
	i32 122350210, ; 23: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 229
	i32 166617380, ; 28: de/System.ServiceModel.NetFramingBase.resources.dll => 0x9ee6124 => 358
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 276
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 192921502, ; 32: fr\System.ServiceModel.Http.resources => 0xb7fbf9e => 347
	i32 193868653, ; 33: de\System.ServiceModel.NetNamedPipe.resources => 0xb8e336d => 371
	i32 195452805, ; 34: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 327
	i32 199333315, ; 35: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 328
	i32 205061960, ; 36: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 37: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 222
	i32 209580789, ; 38: ko\System.ServiceModel.Federation.resources => 0xc7df2f5 => 337
	i32 220171995, ; 39: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 40: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 250
	i32 230752869, ; 41: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 230884747, ; 42: ru/System.ServiceModel.Primitives.resources.dll => 0xdc3058b => 405
	i32 231409092, ; 43: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 44: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 45: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 247181326, ; 46: es/System.ServiceModel.NetNamedPipe.resources.dll => 0xebbb00e => 372
	i32 261689757, ; 47: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 233
	i32 276479776, ; 48: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 49: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 252
	i32 280482487, ; 50: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 249
	i32 280992041, ; 51: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 299
	i32 285314186, ; 52: it\System.ServiceModel.Primitives.resources => 0x11018c8a => 400
	i32 291076382, ; 53: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 296834212, ; 54: zh-Hans\System.ServiceModel.Http.resources => 0x11b154a4 => 355
	i32 298918909, ; 55: System.Net.Ping.dll => 0x11d123fd => 69
	i32 316078633, ; 56: pl\System.ServiceModel.Http.resources => 0x12d6fa29 => 351
	i32 317674968, ; 57: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 327
	i32 318968648, ; 58: Xamarin.AndroidX.Activity.dll => 0x13031348 => 213
	i32 320721186, ; 59: ko/System.ServiceModel.NetTcp.resources.dll => 0x131dd122 => 389
	i32 321597661, ; 60: System.Numerics => 0x132b30dd => 83
	i32 324831035, ; 61: ja/System.ServiceModel.NetFramingBase.resources.dll => 0x135c873b => 362
	i32 336156722, ; 62: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 312
	i32 342366114, ; 63: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 251
	i32 356389973, ; 64: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 311
	i32 360082299, ; 65: System.ServiceModel.Web => 0x15766b7b => 131
	i32 361065771, ; 66: cs/System.ServiceModel.NetTcp.resources.dll => 0x15856d2b => 383
	i32 367780167, ; 67: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 68: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 69: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 70: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 71: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 72: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 73: _Microsoft.Android.Resource.Designer => 0x17969339 => 412
	i32 403441872, ; 74: WindowsBase => 0x180c08d0 => 165
	i32 420389340, ; 75: es\System.ServiceModel.NetNamedPipe.resources => 0x190ea1dc => 372
	i32 435591531, ; 76: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 323
	i32 441335492, ; 77: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 234
	i32 442565967, ; 78: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 79: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 247
	i32 451504562, ; 80: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456096849, ; 81: zh-Hans/System.ServiceModel.Primitives.resources.dll => 0x1b2f7c51 => 407
	i32 456227837, ; 82: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 83: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 84: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 85: System.dll => 0x1bff388e => 164
	i32 470570628, ; 86: TaskyAndroid.dll => 0x1c0c5684 => 0
	i32 476646585, ; 87: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 249
	i32 482736244, ; 88: fr/System.ServiceModel.NetNamedPipe.resources.dll => 0x1cc5f874 => 373
	i32 486930444, ; 89: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 262
	i32 498788369, ; 90: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 91: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 310
	i32 500534657, ; 92: tr/System.ServiceModel.Http.resources.dll => 0x1dd58d81 => 354
	i32 503918385, ; 93: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 304
	i32 513247710, ; 94: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 186
	i32 520748051, ; 95: ja\System.ServiceModel.NetTcp.resources => 0x1f09fc13 => 388
	i32 525250519, ; 96: de/System.ServiceModel.NetTcp.resources.dll => 0x1f4eafd7 => 384
	i32 526420162, ; 97: System.Transactions.dll => 0x1f6088c2 => 150
	i32 530272170, ; 98: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 531014212, ; 99: ja\System.ServiceModel.Primitives.resources => 0x1fa6a244 => 401
	i32 535122277, ; 100: tr/System.ServiceModel.NetNamedPipe.resources.dll => 0x1fe55165 => 380
	i32 539058512, ; 101: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 540030774, ; 102: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 103: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 104: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 105: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 106: Jsr305Binding => 0x213954e7 => 288
	i32 562488221, ; 107: System.ServiceModel => 0x2186e39d => 208
	i32 569334933, ; 108: tr/System.ServiceModel.Federation.resources.dll => 0x21ef5c95 => 341
	i32 569601784, ; 109: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 285
	i32 577335427, ; 110: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 580569086, ; 111: zh-Hans\System.ServiceModel.NetTcp.resources => 0x229ac7fe => 394
	i32 592146354, ; 112: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 318
	i32 597488923, ; 113: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 114: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 115: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 116: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 625044127, ; 117: es/System.ServiceModel.NetTcp.resources.dll => 0x25416a9f => 385
	i32 627609679, ; 118: Xamarin.AndroidX.CustomView => 0x2568904f => 239
	i32 627931235, ; 119: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 316
	i32 634015394, ; 120: tr\System.ServiceModel.Primitives.resources => 0x25ca4ea2 => 406
	i32 635078218, ; 121: de\System.ServiceModel.Primitives.resources => 0x25da864a => 397
	i32 639843206, ; 122: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 245
	i32 643868501, ; 123: System.Net => 0x2660a755 => 81
	i32 643983915, ; 124: System.ServiceModel.Security => 0x26626a2b => 207
	i32 648503046, ; 125: de\System.ServiceModel.Federation.resources => 0x26a75f06 => 332
	i32 662205335, ; 126: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 127: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 281
	i32 666292255, ; 128: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 220
	i32 672442732, ; 129: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 130: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 131: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 298
	i32 690569205, ; 132: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 133: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 294
	i32 693804605, ; 134: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 135: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700069175, ; 136: cs/System.ServiceModel.NetNamedPipe.resources.dll => 0x29ba3537 => 370
	i32 700284507, ; 137: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 292
	i32 700358131, ; 138: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 139: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 313
	i32 709152836, ; 140: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 198
	i32 709557578, ; 141: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 301
	i32 710880553, ; 142: fr/System.ServiceModel.Primitives.resources.dll => 0x2a5f2d29 => 399
	i32 722857257, ; 143: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 144: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 145: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 146: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 210
	i32 759454413, ; 147: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 148: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 767064363, ; 149: it/System.ServiceModel.NetNamedPipe.resources.dll => 0x2db8792b => 374
	i32 775507847, ; 150: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 151: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 322
	i32 782533833, ; 152: Xamarin.Google.AutoValue.Annotations.dll => 0x2ea484c9 => 287
	i32 789151979, ; 153: Microsoft.Extensions.Options => 0x2f0980eb => 185
	i32 790371945, ; 154: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 240
	i32 804715423, ; 155: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 156: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 254
	i32 823281589, ; 157: System.Private.Uri.dll => 0x311247b5 => 86
	i32 823444754, ; 158: zh-Hant\System.ServiceModel.Http.resources => 0x3114c512 => 356
	i32 828535308, ; 159: System.ServiceModel.NetNamedPipe => 0x3162720c => 203
	i32 830298997, ; 160: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 161: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 162: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 163: Xamarin.AndroidX.Print => 0x3246f6cd => 267
	i32 852919649, ; 164: pt-BR/System.ServiceModel.Primitives.resources.dll => 0x32d68561 => 404
	i32 873119928, ; 165: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 166: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 167: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 168: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 169: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 170: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 325
	i32 928116545, ; 171: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 291
	i32 952186615, ; 172: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 959135198, ; 173: fr/System.ServiceModel.NetFramingBase.resources.dll => 0x392b3dde => 360
	i32 966729478, ; 174: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 289
	i32 967690846, ; 175: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 251
	i32 972805734, ; 176: System.ServiceModel.Http => 0x39fbd666 => 201
	i32 975236339, ; 177: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 178: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 980852653, ; 179: pl\System.ServiceModel.Federation.resources => 0x3a769fad => 338
	i32 986514023, ; 180: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 181: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 182: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 183: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 184: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 185: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 271
	i32 1019214401, ; 186: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 187: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 180
	i32 1029334545, ; 188: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 300
	i32 1031528504, ; 189: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 290
	i32 1033084130, ; 190: cs/System.ServiceModel.NetFramingBase.resources.dll => 0x3d939ce2 => 357
	i32 1035644815, ; 191: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 218
	i32 1036536393, ; 192: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 193: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1047490775, ; 194: ru/System.ServiceModel.Http.resources.dll => 0x3e6f70d7 => 353
	i32 1052210849, ; 195: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 258
	i32 1061503568, ; 196: Xamarin.Google.AutoValue.Annotations => 0x3f454250 => 287
	i32 1067306892, ; 197: GoogleGson => 0x3f9dcf8c => 176
	i32 1081414353, ; 198: System.ServiceModel.Http.dll => 0x407512d1 => 201
	i32 1082857460, ; 199: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 200: Xamarin.Kotlin.StdLib => 0x409e66d8 => 293
	i32 1095172895, ; 201: it/System.ServiceModel.NetTcp.resources.dll => 0x4147031f => 387
	i32 1098259244, ; 202: System => 0x41761b2c => 164
	i32 1117830343, ; 203: ru/System.ServiceModel.Federation.resources.dll => 0x42a0bcc7 => 340
	i32 1118262833, ; 204: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 313
	i32 1121599056, ; 205: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 257
	i32 1127624469, ; 206: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1131748925, ; 207: ru\System.ServiceModel.Http.resources => 0x43751e3d => 353
	i32 1137475283, ; 208: fr\System.ServiceModel.Federation.resources => 0x43cc7ed3 => 334
	i32 1142243660, ; 209: zh-Hant/System.ServiceModel.Http.resources.dll => 0x4415414c => 356
	i32 1149092582, ; 210: Xamarin.AndroidX.Window => 0x447dc2e6 => 284
	i32 1168523401, ; 211: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 319
	i32 1170634674, ; 212: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 213: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 280
	i32 1178241025, ; 214: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 265
	i32 1203215381, ; 215: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 317
	i32 1204270330, ; 216: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 220
	i32 1205230995, ; 217: it/System.ServiceModel.Http.resources.dll => 0x47d65d93 => 348
	i32 1207862497, ; 218: System.ServiceModel.NetTcp.dll => 0x47fe84e1 => 204
	i32 1208641965, ; 219: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 220: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 221: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 315
	i32 1243150071, ; 222: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 285
	i32 1246548578, ; 223: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 230
	i32 1253011324, ; 224: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 225: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 299
	i32 1264511973, ; 226: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 275
	i32 1264890200, ; 227: Xamarin.KotlinX.Coroutines.Core.dll => 0x4b64b158 => 295
	i32 1267360935, ; 228: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 279
	i32 1273260888, ; 229: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 231
	i32 1275534314, ; 230: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 294
	i32 1278448581, ; 231: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 217
	i32 1293217323, ; 232: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 242
	i32 1296184643, ; 233: pl\System.ServiceModel.NetFramingBase.resources => 0x4d423543 => 364
	i32 1307310235, ; 234: pl/System.ServiceModel.Http.resources.dll => 0x4debf89b => 351
	i32 1309188875, ; 235: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1314523075, ; 236: fr/System.ServiceModel.NetTcp.resources.dll => 0x4e5a07c3 => 386
	i32 1322716291, ; 237: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 284
	i32 1324164729, ; 238: System.Linq => 0x4eed2679 => 61
	i32 1324212547, ; 239: pt-BR\System.ServiceModel.NetTcp.resources => 0x4eede143 => 391
	i32 1335329327, ; 240: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1360479413, ; 241: it\System.ServiceModel.Federation.resources => 0x511744b5 => 335
	i32 1361525254, ; 242: ru\System.ServiceModel.NetNamedPipe.resources => 0x51273a06 => 379
	i32 1364015309, ; 243: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 244: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 329
	i32 1376866003, ; 245: Xamarin.AndroidX.SavedState => 0x52114ed3 => 271
	i32 1379779777, ; 246: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1394641819, ; 247: System.ServiceModel.Primitives => 0x53208b9b => 206
	i32 1397695725, ; 248: Microsoft.IdentityModel.Xml => 0x534f24ed => 191
	i32 1402170036, ; 249: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 250: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 235
	i32 1408764838, ; 251: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 252: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 253: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1423907884, ; 254: zh-Hant/System.ServiceModel.Primitives.resources.dll => 0x54df1c2c => 408
	i32 1430672901, ; 255: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 297
	i32 1430830959, ; 256: zh-Hant\System.ServiceModel.NetFramingBase.resources => 0x5548bf6f => 369
	i32 1434145427, ; 257: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 258: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 289
	i32 1439761251, ; 259: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1442844750, ; 260: cs/System.ServiceModel.Primitives.resources.dll => 0x5600104e => 396
	i32 1452070440, ; 261: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 262: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 263: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 264: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 265: es\Microsoft.Maui.Controls.resources => 0x57152abe => 303
	i32 1461234159, ; 266: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 267: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 268: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 269: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 219
	i32 1470490898, ; 270: Microsoft.Extensions.Primitives => 0x57a5e912 => 186
	i32 1479771757, ; 271: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 272: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 273: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 274: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 272
	i32 1493001747, ; 275: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 307
	i32 1496356098, ; 276: pt-BR\System.ServiceModel.NetFramingBase.resources => 0x59309502 => 365
	i32 1514721132, ; 277: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 302
	i32 1536373174, ; 278: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 279: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 280: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 281: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 282: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 322
	i32 1552155078, ; 283: System.ServiceModel.NetFramingBase => 0x5c8401c6 => 202
	i32 1565862583, ; 284: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 285: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 286: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 287: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 288: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 241
	i32 1590860858, ; 289: System.ServiceModel.NetTcp => 0x5ed29c3a => 204
	i32 1592978981, ; 290: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 291: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 290
	i32 1601112923, ; 292: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 293: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 409
	i32 1604827217, ; 294: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 295: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 296: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 261
	i32 1622358360, ; 297: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 298: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 283
	i32 1626255391, ; 299: Microsoft.IdentityModel.Protocols.WsTrust => 0x60eeb01f => 188
	i32 1628529952, ; 300: pt-BR/System.ServiceModel.Http.resources.dll => 0x61116520 => 352
	i32 1629788937, ; 301: cs\System.ServiceModel.Primitives.resources => 0x61249b09 => 396
	i32 1634654947, ; 302: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 175
	i32 1635184631, ; 303: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 245
	i32 1636350590, ; 304: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 238
	i32 1639515021, ; 305: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 306: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 307: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1656530436, ; 308: ja/System.ServiceModel.NetNamedPipe.resources.dll => 0x62bca604 => 375
	i32 1657153582, ; 309: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 310: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 277
	i32 1658251792, ; 311: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 286
	i32 1661950287, ; 312: ru/System.ServiceModel.NetNamedPipe.resources.dll => 0x630f594f => 379
	i32 1670060433, ; 313: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 233
	i32 1675553242, ; 314: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 315: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 316: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 317: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 318: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 319: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1701541528, ; 320: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1717748983, ; 321: ko/System.ServiceModel.Federation.resources.dll => 0x6662c4f7 => 337
	i32 1720223769, ; 322: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 254
	i32 1726116996, ; 323: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 324: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 325: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 228
	i32 1736233607, ; 326: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 320
	i32 1743415430, ; 327: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 298
	i32 1744735666, ; 328: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 329: Mono.Android.Export => 0x6816ab6a => 169
	i32 1749969296, ; 330: it/System.ServiceModel.Federation.resources.dll => 0x684e6990 => 335
	i32 1750313021, ; 331: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 332: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 333: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 334: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 335: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 276
	i32 1770582343, ; 336: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1775568156, ; 337: de/System.ServiceModel.Primitives.resources.dll => 0x69d5051c => 397
	i32 1776026572, ; 338: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 339: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 340: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 341: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 314
	i32 1787719884, ; 342: tr/System.ServiceModel.NetFramingBase.resources.dll => 0x6a8e70cc => 367
	i32 1788241197, ; 343: Xamarin.AndroidX.Fragment => 0x6a96652d => 247
	i32 1792213857, ; 344: ru\System.ServiceModel.Federation.resources => 0x6ad30361 => 340
	i32 1793755602, ; 345: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 306
	i32 1808609942, ; 346: Xamarin.AndroidX.Loader => 0x6bcd3296 => 261
	i32 1813058853, ; 347: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 293
	i32 1813201214, ; 348: Xamarin.Google.Android.Material => 0x6c13413e => 286
	i32 1818569960, ; 349: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 266
	i32 1818787751, ; 350: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 351: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 352: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827118058, ; 353: pl\System.ServiceModel.NetNamedPipe.resources => 0x6ce79bea => 377
	i32 1827303595, ; 354: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 411
	i32 1828688058, ; 355: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1834522491, ; 356: pt-BR\System.ServiceModel.Http.resources => 0x6d58977b => 352
	i32 1842015223, ; 357: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 326
	i32 1847515442, ; 358: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 210
	i32 1852096909, ; 359: tr/System.ServiceModel.NetTcp.resources.dll => 0x6e64c18d => 393
	i32 1853025655, ; 360: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 323
	i32 1858542181, ; 361: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1866818530, ; 362: Xamarin.AndroidX.Camera.Video => 0x6f4563e2 => 226
	i32 1870090363, ; 363: ko/System.ServiceModel.NetNamedPipe.resources.dll => 0x6f77507b => 376
	i32 1870277092, ; 364: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 365: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 305
	i32 1879696579, ; 366: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1882505209, ; 367: tr/System.ServiceModel.Primitives.resources.dll => 0x7034bff9 => 406
	i32 1885316902, ; 368: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 221
	i32 1885918049, ; 369: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 411
	i32 1888955245, ; 370: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 371: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 372: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 373: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 374: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1922109462, ; 375: System.ServiceModel.Primitives.dll => 0x72911016 => 206
	i32 1932085498, ; 376: fr\System.ServiceModel.Primitives.resources => 0x732948fa => 399
	i32 1939592360, ; 377: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1946106882, ; 378: es\System.ServiceModel.NetFramingBase.resources => 0x73ff3c02 => 359
	i32 1954170934, ; 379: fr/System.ServiceModel.Federation.resources.dll => 0x747a4836 => 334
	i32 1956758971, ; 380: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1960645073, ; 381: ko\System.ServiceModel.NetTcp.resources => 0x74dd11d1 => 389
	i32 1961813231, ; 382: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 273
	i32 1968388702, ; 383: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1973329537, ; 384: ru/System.ServiceModel.NetFramingBase.resources.dll => 0x759e9e81 => 366
	i32 1985761444, ; 385: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 212
	i32 1986222447, ; 386: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 189
	i32 1999793157, ; 387: ja/System.ServiceModel.NetTcp.resources.dll => 0x77326c05 => 388
	i32 2003115576, ; 388: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 302
	i32 2011961780, ; 389: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2016668428, ; 390: CommunityToolkit.Maui.Camera.dll => 0x7833eb0c => 174
	i32 2019465201, ; 391: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 258
	i32 2025202353, ; 392: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 297
	i32 2031763787, ; 393: Xamarin.Android.Glide => 0x791a414b => 209
	i32 2045470958, ; 394: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 395: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 253
	i32 2060060697, ; 396: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 397: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 301
	i32 2070888862, ; 398: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2078280433, ; 399: zh-Hans/System.ServiceModel.NetFramingBase.resources.dll => 0x7be00af1 => 368
	i32 2079903147, ; 400: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2085039813, ; 401: System.Security.Cryptography.Xml.dll => 0x7c472ec5 => 199
	i32 2086675053, ; 402: System.ServiceModel.NetFramingBase.dll => 0x7c60226d => 202
	i32 2090596640, ; 403: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2092919810, ; 404: System.ServiceModel.dll => 0x7cbf6c02 => 208
	i32 2093814594, ; 405: Microsoft.IdentityModel.Tokens.Saml.dll => 0x7ccd1342 => 190
	i32 2098812199, ; 406: de/System.ServiceModel.Http.resources.dll => 0x7d195527 => 345
	i32 2118004960, ; 407: fr\System.ServiceModel.NetNamedPipe.resources => 0x7e3e30e0 => 373
	i32 2127167465, ; 408: System.Console => 0x7ec9ffe9 => 20
	i32 2132115774, ; 409: zh-Hant/System.ServiceModel.NetFramingBase.resources.dll => 0x7f15813e => 369
	i32 2142473426, ; 410: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 411: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 412: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 413: Microsoft.Maui => 0x80bd55ad => 195
	i32 2169148018, ; 414: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 309
	i32 2181898931, ; 415: Microsoft.Extensions.Options.dll => 0x820d22b3 => 185
	i32 2192057212, ; 416: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 417: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 418: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 296
	i32 2201231467, ; 419: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 420: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 184
	i32 2207618523, ; 421: it\Microsoft.Maui.Controls.resources => 0x839595db => 311
	i32 2217644978, ; 422: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 280
	i32 2222056684, ; 423: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2223829768, ; 424: ko/System.ServiceModel.Primitives.resources.dll => 0x848cf308 => 402
	i32 2224792570, ; 425: zh-Hant/System.ServiceModel.NetTcp.resources.dll => 0x849ba3fa => 395
	i32 2227276228, ; 426: cs\System.ServiceModel.NetFramingBase.resources => 0x84c189c4 => 357
	i32 2244775296, ; 427: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 262
	i32 2252106437, ; 428: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 429: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 430: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 431: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267999099, ; 432: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 211
	i32 2270573516, ; 433: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 305
	i32 2279755925, ; 434: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 269
	i32 2292263403, ; 435: zh-Hant\System.ServiceModel.Primitives.resources => 0x88a129eb => 408
	i32 2293034957, ; 436: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2294984242, ; 437: pl/System.ServiceModel.NetFramingBase.resources.dll => 0x88caae32 => 364
	i32 2295906218, ; 438: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 439: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 440: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 315
	i32 2305521784, ; 441: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2306840234, ; 442: cs\System.ServiceModel.Federation.resources => 0x897f96aa => 331
	i32 2315684594, ; 443: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 215
	i32 2320631194, ; 444: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2333576127, ; 445: pt-BR/System.ServiceModel.NetTcp.resources.dll => 0x8b178bbf => 391
	i32 2340441535, ; 446: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 447: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2348932370, ; 448: Microsoft.IdentityModel.Tokens.Saml => 0x8c01dd12 => 190
	i32 2353062107, ; 449: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 450: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 451: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 187
	i32 2371007202, ; 452: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2378619854, ; 453: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 454: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2393708825, ; 455: es\System.ServiceModel.Http.resources => 0x8ead1919 => 346
	i32 2395872292, ; 456: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 310
	i32 2401565422, ; 457: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 458: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 244
	i32 2409983638, ; 459: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 410
	i32 2418341376, ; 460: Xamarin.AndroidX.Camera.Video.dll => 0x9024f600 => 226
	i32 2421380589, ; 461: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 462: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 231
	i32 2427813419, ; 463: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 307
	i32 2435356389, ; 464: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 465: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 466: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2454894271, ; 467: pl/System.ServiceModel.NetTcp.resources.dll => 0x9252b6bf => 390
	i32 2458678730, ; 468: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 469: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 470: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 234
	i32 2466230705, ; 471: fr/System.ServiceModel.Http.resources.dll => 0x92ffb1b1 => 347
	i32 2471841756, ; 472: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 473: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 474: Microsoft.Maui.Controls => 0x93dba8a1 => 193
	i32 2483903535, ; 475: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 476: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 477: System.AppContext.dll => 0x94798bc5 => 6
	i32 2491939797, ; 478: pt-BR\System.ServiceModel.NetNamedPipe.resources => 0x9487fbd5 => 378
	i32 2501346920, ; 479: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503402960, ; 480: de\System.ServiceModel.NetFramingBase.resources => 0x9536e5d0 => 358
	i32 2505896520, ; 481: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 256
	i32 2522472828, ; 482: Xamarin.Android.Glide.dll => 0x9659e17c => 209
	i32 2538310050, ; 483: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2539621919, ; 484: es/System.ServiceModel.Federation.resources.dll => 0x975f8e1f => 333
	i32 2550873716, ; 485: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 308
	i32 2562349572, ; 486: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 487: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2574359397, ; 488: tr\System.ServiceModel.NetFramingBase.resources => 0x99719b65 => 367
	i32 2577645437, ; 489: ko/System.ServiceModel.NetFramingBase.resources.dll => 0x99a3bf7d => 363
	i32 2581783588, ; 490: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 257
	i32 2581819634, ; 491: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 279
	i32 2585220780, ; 492: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 493: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 494: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2591523840, ; 495: it/System.ServiceModel.Primitives.resources.dll => 0x9a778400 => 400
	i32 2593496499, ; 496: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 317
	i32 2605712449, ; 497: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 296
	i32 2615233544, ; 498: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 248
	i32 2616218305, ; 499: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 500: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 501: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 502: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 238
	i32 2624644809, ; 503: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 243
	i32 2626831493, ; 504: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 312
	i32 2627185994, ; 505: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 506: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 507: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 252
	i32 2640290731, ; 508: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 187
	i32 2654295266, ; 509: ru/System.ServiceModel.NetTcp.resources.dll => 0x9e3554e2 => 392
	i32 2659772221, ; 510: es\System.ServiceModel.Federation.resources => 0x9e88e73d => 333
	i32 2663391936, ; 511: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 211
	i32 2663698177, ; 512: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 513: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 514: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2671474046, ; 515: Xamarin.KotlinX.Coroutines.Core => 0x9f3b757e => 295
	i32 2676780864, ; 516: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 517: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 518: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 519: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 277
	i32 2705927368, ; 520: zh-Hant/System.ServiceModel.Federation.resources.dll => 0xa1492cc8 => 343
	i32 2712765783, ; 521: pl/System.ServiceModel.Primitives.resources.dll => 0xa1b18557 => 403
	i32 2715334215, ; 522: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 523: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 524: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 525: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2724977475, ; 526: pt-BR/System.ServiceModel.Federation.resources.dll => 0xa26bdb43 => 339
	i32 2732626843, ; 527: Xamarin.AndroidX.Activity => 0xa2e0939b => 213
	i32 2735172069, ; 528: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 529: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 219
	i32 2740877318, ; 530: it\System.ServiceModel.NetTcp.resources => 0xa35e7806 => 387
	i32 2740948882, ; 531: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2742465751, ; 532: zh-Hans/System.ServiceModel.NetTcp.resources.dll => 0xa376b4d7 => 394
	i32 2748088231, ; 533: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 534: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 318
	i32 2753493119, ; 535: System.ServiceModel.Security.dll => 0xa41ef87f => 207
	i32 2756478476, ; 536: zh-Hant\System.ServiceModel.NetTcp.resources => 0xa44c860c => 395
	i32 2758225723, ; 537: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 194
	i32 2764765095, ; 538: Microsoft.Maui.dll => 0xa4caf7a7 => 195
	i32 2765824710, ; 539: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 540: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 292
	i32 2778768386, ; 541: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 282
	i32 2779977773, ; 542: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 270
	i32 2780661947, ; 543: pl/System.ServiceModel.NetNamedPipe.resources.dll => 0xa5bd88bb => 377
	i32 2785988530, ; 544: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 324
	i32 2788224221, ; 545: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 248
	i32 2801831435, ; 546: Microsoft.Maui.Graphics => 0xa7008e0b => 197
	i32 2803228030, ; 547: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 548: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 303
	i32 2810250172, ; 549: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 235
	i32 2819470561, ; 550: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 551: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 552: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 270
	i32 2822016028, ; 553: zh-Hans/System.ServiceModel.NetNamedPipe.resources.dll => 0xa8348c1c => 381
	i32 2824502124, ; 554: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 555: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 316
	i32 2838993487, ; 556: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 259
	i32 2849599387, ; 557: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 558: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 282
	i32 2855708567, ; 559: Xamarin.AndroidX.Transition => 0xaa36a797 => 278
	i32 2861098320, ; 560: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 561: Microsoft.Maui.Essentials => 0xaa8a4878 => 196
	i32 2868488919, ; 562: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 175
	i32 2870099610, ; 563: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 214
	i32 2875164099, ; 564: Jsr305Binding.dll => 0xab5f85c3 => 288
	i32 2875220617, ; 565: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 566: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 246
	i32 2887636118, ; 567: System.Net.dll => 0xac1dd496 => 81
	i32 2899241291, ; 568: it\System.ServiceModel.Http.resources => 0xaccee94b => 348
	i32 2899753641, ; 569: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 570: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 571: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 572: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 573: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 574: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 283
	i32 2917500511, ; 575: zh-Hant/System.ServiceModel.NetNamedPipe.resources.dll => 0xade5865f => 382
	i32 2919462931, ; 576: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 577: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 216
	i32 2921417940, ; 578: System.Security.Cryptography.Xml => 0xae214cd4 => 199
	i32 2936416060, ; 579: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 580: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 581: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2958066338, ; 582: pl\System.ServiceModel.Primitives.resources => 0xb05082a2 => 403
	i32 2958246600, ; 583: de\System.ServiceModel.Http.resources => 0xb05342c8 => 345
	i32 2959614098, ; 584: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2965157864, ; 585: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 227
	i32 2968338931, ; 586: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 587: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 588: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 242
	i32 2985026235, ; 589: ja\System.ServiceModel.NetNamedPipe.resources => 0xb1ebe2bb => 375
	i32 2987532451, ; 590: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 273
	i32 2991449226, ; 591: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 224
	i32 2996846495, ; 592: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 255
	i32 3000842441, ; 593: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 227
	i32 3016983068, ; 594: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 275
	i32 3022610030, ; 595: ja\System.ServiceModel.Http.resources => 0xb4295e6e => 349
	i32 3023353419, ; 596: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 597: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 250
	i32 3038032645, ; 598: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 412
	i32 3046511124, ; 599: es/System.ServiceModel.Primitives.resources.dll => 0xb5961214 => 398
	i32 3047751430, ; 600: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 224
	i32 3049900938, ; 601: pt-BR/System.ServiceModel.NetNamedPipe.resources.dll => 0xb5c9cb8a => 378
	i32 3056245963, ; 602: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 272
	i32 3057625584, ; 603: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 263
	i32 3059408633, ; 604: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 605: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 606: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 607: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 309
	i32 3084678329, ; 608: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 189
	i32 3090735792, ; 609: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 610: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 611: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 612: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 613: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3123044289, ; 614: System.ServiceModel.Duplex => 0xba25dfc1 => 205
	i32 3123119788, ; 615: Microsoft.IdentityModel.Protocols.WsTrust.dll => 0xba2706ac => 188
	i32 3124832203, ; 616: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 617: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 618: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 619: GoogleGson.dll => 0xbba64c02 => 176
	i32 3157052235, ; 620: System.ServiceModel.Federation.dll => 0xbc2ccb4b => 200
	i32 3159123045, ; 621: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3159587175, ; 622: cs/System.ServiceModel.Http.resources.dll => 0xbc537967 => 344
	i32 3160747431, ; 623: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 624: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 264
	i32 3184440510, ; 625: pt-BR\System.ServiceModel.Federation.resources => 0xbdceb4be => 339
	i32 3192346100, ; 626: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 627: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 628: System.Data.dll => 0xbefef58f => 24
	i32 3206733304, ; 629: ja/System.ServiceModel.Federation.resources.dll => 0xbf22ddf8 => 336
	i32 3209718065, ; 630: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 631: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 241
	i32 3220365878, ; 632: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 633: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3241028803, ; 634: it\System.ServiceModel.NetNamedPipe.resources => 0xc12e2cc3 => 374
	i32 3251039220, ; 635: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 636: Xamarin.AndroidX.CardView => 0xc235e84d => 228
	i32 3265493905, ; 637: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 638: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 639: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3278332997, ; 640: zh-Hans/System.ServiceModel.Http.resources.dll => 0xc3676445 => 355
	i32 3279906254, ; 641: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 642: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 643: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3291006565, ; 644: fr\System.ServiceModel.NetTcp.resources => 0xc428c665 => 386
	i32 3299363146, ; 645: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 646: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 647: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 304
	i32 3316684772, ; 648: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 649: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 239
	i32 3317144872, ; 650: System.Data => 0xc5b79d28 => 24
	i32 3340202976, ; 651: tr\System.ServiceModel.NetNamedPipe.resources => 0xc71773e0 => 380
	i32 3340431453, ; 652: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 221
	i32 3345895724, ; 653: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 268
	i32 3346324047, ; 654: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 265
	i32 3347128195, ; 655: tr\System.ServiceModel.Http.resources => 0xc7811f83 => 354
	i32 3357674450, ; 656: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 321
	i32 3358260929, ; 657: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 658: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 214
	i32 3362522851, ; 659: Xamarin.AndroidX.Core => 0xc86c06e3 => 236
	i32 3366347497, ; 660: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 661: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 269
	i32 3381016424, ; 662: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 300
	i32 3395150330, ; 663: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 664: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 665: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 240
	i32 3406727474, ; 666: zh-Hant\System.ServiceModel.Federation.resources => 0xcb0e8932 => 343
	i32 3412610236, ; 667: CommunityToolkit.Maui.Camera => 0xcb684cbc => 174
	i32 3413944578, ; 668: Xamarin.AndroidX.Camera.Camera2.dll => 0xcb7ca902 => 223
	i32 3421910702, ; 669: Xamarin.AndroidX.Camera.Camera2 => 0xcbf636ae => 223
	i32 3428513518, ; 670: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 179
	i32 3429136800, ; 671: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 672: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 673: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 243
	i32 3445260447, ; 674: System.Formats.Tar => 0xcd5a809f => 39
	i32 3447165740, ; 675: ja/System.ServiceModel.Http.resources.dll => 0xcd77932c => 349
	i32 3450008806, ; 676: ja\System.ServiceModel.Federation.resources => 0xcda2f4e6 => 336
	i32 3452344032, ; 677: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 192
	i32 3453180490, ; 678: ko\System.ServiceModel.Primitives.resources => 0xcdd35a4a => 402
	i32 3463511458, ; 679: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 308
	i32 3471940407, ; 680: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 681: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 682: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 321
	i32 3482217531, ; 683: cs\System.ServiceModel.Http.resources => 0xcf8e6c3b => 344
	i32 3483609038, ; 684: es/System.ServiceModel.Http.resources.dll => 0xcfa3a7ce => 346
	i32 3484440000, ; 685: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 320
	i32 3485117614, ; 686: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 687: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 688: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 232
	i32 3509114376, ; 689: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 690: System.Security.dll => 0xd1854eb4 => 130
	i32 3521184679, ; 691: ru\System.ServiceModel.NetFramingBase.resources => 0xd1e103a7 => 366
	i32 3530912306, ; 692: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 693: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3548480101, ; 694: de/System.ServiceModel.Federation.resources.dll => 0xd3818265 => 332
	i32 3560100363, ; 695: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 696: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580333612, ; 697: zh-Hans\System.ServiceModel.Federation.resources => 0xd5678e2c => 342
	i32 3580758918, ; 698: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 328
	i32 3597029428, ; 699: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 212
	i32 3598340787, ; 700: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3605274052, ; 701: ja\System.ServiceModel.NetFramingBase.resources => 0xd6e41dc4 => 362
	i32 3605918211, ; 702: tr\System.ServiceModel.NetTcp.resources => 0xd6edf203 => 393
	i32 3608519521, ; 703: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 704: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 705: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 267
	i32 3632773286, ; 706: zh-Hans\System.ServiceModel.NetNamedPipe.resources => 0xd887b8a6 => 381
	i32 3633644679, ; 707: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 216
	i32 3638233600, ; 708: ru\System.ServiceModel.Primitives.resources => 0xd8db0a00 => 405
	i32 3638274909, ; 709: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 710: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 253
	i32 3641688426, ; 711: it/System.ServiceModel.NetFramingBase.resources.dll => 0xd90fc16a => 361
	i32 3643446276, ; 712: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 325
	i32 3643854240, ; 713: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 264
	i32 3645089577, ; 714: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 715: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 716: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3664118907, ; 717: pt-BR\System.ServiceModel.Primitives.resources => 0xda66047b => 404
	i32 3672681054, ; 718: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3675849680, ; 719: cs\System.ServiceModel.NetTcp.resources => 0xdb1903d0 => 383
	i32 3676461095, ; 720: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 225
	i32 3676670898, ; 721: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 409
	i32 3680281109, ; 722: ko/System.ServiceModel.Http.resources.dll => 0xdb5ca215 => 350
	i32 3682565725, ; 723: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 222
	i32 3684561358, ; 724: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 232
	i32 3685718856, ; 725: pl/System.ServiceModel.Federation.resources.dll => 0xdbaf9b48 => 338
	i32 3690488555, ; 726: pl\System.ServiceModel.NetTcp.resources => 0xdbf862eb => 390
	i32 3697841164, ; 727: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 330
	i32 3700619798, ; 728: pt-BR/System.ServiceModel.NetFramingBase.resources.dll => 0xdc92fa16 => 365
	i32 3700866549, ; 729: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3705132617, ; 730: it\System.ServiceModel.NetFramingBase.resources => 0xdcd7d649 => 361
	i32 3706696989, ; 731: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 237
	i32 3709546624, ; 732: ru\System.ServiceModel.NetTcp.resources => 0xdd1b3080 => 392
	i32 3716563718, ; 733: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 734: Xamarin.AndroidX.Annotation => 0xdda814c6 => 215
	i32 3724971120, ; 735: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 263
	i32 3732100267, ; 736: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 737: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3743991391, ; 738: de\System.ServiceModel.NetTcp.resources => 0xdf28c65f => 384
	i32 3748608112, ; 739: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 740: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3765508441, ; 741: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 184
	i32 3786282454, ; 742: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 229
	i32 3792276235, ; 743: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 744: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 192
	i32 3802395368, ; 745: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3807198597, ; 746: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 198
	i32 3813989096, ; 747: ko\System.ServiceModel.NetFramingBase.resources => 0xe354dae8 => 363
	i32 3817368567, ; 748: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 749: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 750: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 751: System.Numerics.dll => 0xe4436460 => 83
	i32 3831382396, ; 752: es\System.ServiceModel.Primitives.resources => 0xe45e417c => 398
	i32 3836405899, ; 753: cs/System.ServiceModel.Federation.resources.dll => 0xe4aae88b => 331
	i32 3841636137, ; 754: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 180
	i32 3844307129, ; 755: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 756: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 757: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 758: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 759: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876601672, ; 760: zh-Hans\System.ServiceModel.NetFramingBase.resources => 0xe7103f48 => 368
	i32 3885497537, ; 761: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 762: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 278
	i32 3888767677, ; 763: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 268
	i32 3889960447, ; 764: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 329
	i32 3896106733, ; 765: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 766: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 236
	i32 3901907137, ; 767: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3910130544, ; 768: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 230
	i32 3917319797, ; 769: System.ServiceModel.Federation => 0xe97d8e75 => 200
	i32 3920810846, ; 770: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 771: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 281
	i32 3928044579, ; 772: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 773: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 774: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 266
	i32 3945713374, ; 775: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3948719759, ; 776: es/System.ServiceModel.NetFramingBase.resources.dll => 0xeb5cae8f => 359
	i32 3953953790, ; 777: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 778: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 218
	i32 3959773229, ; 779: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 255
	i32 3971291721, ; 780: System.ServiceModel.NetNamedPipe.dll => 0xecb51a49 => 203
	i32 3980434154, ; 781: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 324
	i32 3987592930, ; 782: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 306
	i32 4003436829, ; 783: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 784: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 217
	i32 4025784931, ; 785: System.Memory => 0xeff49a63 => 62
	i32 4043772061, ; 786: zh-Hans/System.ServiceModel.Federation.resources.dll => 0xf107109d => 342
	i32 4046471985, ; 787: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 194
	i32 4054681211, ; 788: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 789: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 790: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4081805871, ; 791: zh-Hans\System.ServiceModel.Primitives.resources => 0xf34b6a2f => 407
	i32 4094352644, ; 792: Microsoft.Maui.Essentials.dll => 0xf40add04 => 196
	i32 4099507663, ; 793: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 794: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 795: Xamarin.AndroidX.Emoji2 => 0xf479582c => 244
	i32 4102112229, ; 796: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 319
	i32 4120300202, ; 797: de/System.ServiceModel.NetNamedPipe.resources.dll => 0xf596caaa => 371
	i32 4125707920, ; 798: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 314
	i32 4126470640, ; 799: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 179
	i32 4127667938, ; 800: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 801: System.AppContext => 0xf6318da0 => 6
	i32 4137271634, ; 802: Microsoft.IdentityModel.Xml.dll => 0xf699c152 => 191
	i32 4147710070, ; 803: ko\System.ServiceModel.NetNamedPipe.resources => 0xf7390876 => 376
	i32 4147896353, ; 804: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 805: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 326
	i32 4151237749, ; 806: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 807: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 808: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 809: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 810: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 811: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 260
	i32 4182880526, ; 812: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 410
	i32 4185676441, ; 813: System.Security => 0xf97c5a99 => 130
	i32 4195421176, ; 814: TaskyAndroid => 0xfa110bf8 => 0
	i32 4196529839, ; 815: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 816: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 817: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 237
	i32 4258378803, ; 818: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 259
	i32 4260525087, ; 819: System.Buffers => 0xfdf2741f => 7
	i32 4261754524, ; 820: ko\System.ServiceModel.Http.resources => 0xfe05369c => 350
	i32 4266814471, ; 821: zh-Hant\System.ServiceModel.NetNamedPipe.resources => 0xfe526c07 => 382
	i32 4271975918, ; 822: Microsoft.Maui.Controls.dll => 0xfea12dee => 193
	i32 4274976490, ; 823: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 824: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 260
	i32 4294763496 ; 825: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 246
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [826 x i32] [
	i32 68, ; 0
	i32 360, ; 1
	i32 67, ; 2
	i32 108, ; 3
	i32 385, ; 4
	i32 341, ; 5
	i32 256, ; 6
	i32 291, ; 7
	i32 48, ; 8
	i32 80, ; 9
	i32 225, ; 10
	i32 145, ; 11
	i32 205, ; 12
	i32 30, ; 13
	i32 330, ; 14
	i32 124, ; 15
	i32 370, ; 16
	i32 197, ; 17
	i32 102, ; 18
	i32 401, ; 19
	i32 274, ; 20
	i32 107, ; 21
	i32 274, ; 22
	i32 139, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 229, ; 27
	i32 358, ; 28
	i32 132, ; 29
	i32 276, ; 30
	i32 151, ; 31
	i32 347, ; 32
	i32 371, ; 33
	i32 327, ; 34
	i32 328, ; 35
	i32 18, ; 36
	i32 222, ; 37
	i32 337, ; 38
	i32 26, ; 39
	i32 250, ; 40
	i32 1, ; 41
	i32 405, ; 42
	i32 59, ; 43
	i32 42, ; 44
	i32 91, ; 45
	i32 372, ; 46
	i32 233, ; 47
	i32 147, ; 48
	i32 252, ; 49
	i32 249, ; 50
	i32 299, ; 51
	i32 400, ; 52
	i32 54, ; 53
	i32 355, ; 54
	i32 69, ; 55
	i32 351, ; 56
	i32 327, ; 57
	i32 213, ; 58
	i32 389, ; 59
	i32 83, ; 60
	i32 362, ; 61
	i32 312, ; 62
	i32 251, ; 63
	i32 311, ; 64
	i32 131, ; 65
	i32 383, ; 66
	i32 55, ; 67
	i32 149, ; 68
	i32 74, ; 69
	i32 145, ; 70
	i32 62, ; 71
	i32 146, ; 72
	i32 412, ; 73
	i32 165, ; 74
	i32 372, ; 75
	i32 323, ; 76
	i32 234, ; 77
	i32 12, ; 78
	i32 247, ; 79
	i32 125, ; 80
	i32 407, ; 81
	i32 152, ; 82
	i32 113, ; 83
	i32 166, ; 84
	i32 164, ; 85
	i32 0, ; 86
	i32 249, ; 87
	i32 373, ; 88
	i32 262, ; 89
	i32 84, ; 90
	i32 310, ; 91
	i32 354, ; 92
	i32 304, ; 93
	i32 186, ; 94
	i32 388, ; 95
	i32 384, ; 96
	i32 150, ; 97
	i32 60, ; 98
	i32 401, ; 99
	i32 380, ; 100
	i32 181, ; 101
	i32 51, ; 102
	i32 103, ; 103
	i32 114, ; 104
	i32 40, ; 105
	i32 288, ; 106
	i32 208, ; 107
	i32 341, ; 108
	i32 285, ; 109
	i32 120, ; 110
	i32 394, ; 111
	i32 318, ; 112
	i32 173, ; 113
	i32 52, ; 114
	i32 44, ; 115
	i32 119, ; 116
	i32 385, ; 117
	i32 239, ; 118
	i32 316, ; 119
	i32 406, ; 120
	i32 397, ; 121
	i32 245, ; 122
	i32 81, ; 123
	i32 207, ; 124
	i32 332, ; 125
	i32 136, ; 126
	i32 281, ; 127
	i32 220, ; 128
	i32 8, ; 129
	i32 73, ; 130
	i32 298, ; 131
	i32 155, ; 132
	i32 294, ; 133
	i32 154, ; 134
	i32 92, ; 135
	i32 370, ; 136
	i32 292, ; 137
	i32 45, ; 138
	i32 313, ; 139
	i32 198, ; 140
	i32 301, ; 141
	i32 399, ; 142
	i32 109, ; 143
	i32 129, ; 144
	i32 25, ; 145
	i32 210, ; 146
	i32 72, ; 147
	i32 55, ; 148
	i32 374, ; 149
	i32 46, ; 150
	i32 322, ; 151
	i32 287, ; 152
	i32 185, ; 153
	i32 240, ; 154
	i32 22, ; 155
	i32 254, ; 156
	i32 86, ; 157
	i32 356, ; 158
	i32 203, ; 159
	i32 43, ; 160
	i32 160, ; 161
	i32 71, ; 162
	i32 267, ; 163
	i32 404, ; 164
	i32 3, ; 165
	i32 42, ; 166
	i32 63, ; 167
	i32 16, ; 168
	i32 53, ; 169
	i32 325, ; 170
	i32 291, ; 171
	i32 105, ; 172
	i32 360, ; 173
	i32 289, ; 174
	i32 251, ; 175
	i32 201, ; 176
	i32 34, ; 177
	i32 158, ; 178
	i32 338, ; 179
	i32 85, ; 180
	i32 32, ; 181
	i32 12, ; 182
	i32 51, ; 183
	i32 56, ; 184
	i32 271, ; 185
	i32 36, ; 186
	i32 180, ; 187
	i32 300, ; 188
	i32 290, ; 189
	i32 357, ; 190
	i32 218, ; 191
	i32 35, ; 192
	i32 58, ; 193
	i32 353, ; 194
	i32 258, ; 195
	i32 287, ; 196
	i32 176, ; 197
	i32 201, ; 198
	i32 17, ; 199
	i32 293, ; 200
	i32 387, ; 201
	i32 164, ; 202
	i32 340, ; 203
	i32 313, ; 204
	i32 257, ; 205
	i32 183, ; 206
	i32 353, ; 207
	i32 334, ; 208
	i32 356, ; 209
	i32 284, ; 210
	i32 319, ; 211
	i32 153, ; 212
	i32 280, ; 213
	i32 265, ; 214
	i32 317, ; 215
	i32 220, ; 216
	i32 348, ; 217
	i32 204, ; 218
	i32 29, ; 219
	i32 52, ; 220
	i32 315, ; 221
	i32 285, ; 222
	i32 230, ; 223
	i32 5, ; 224
	i32 299, ; 225
	i32 275, ; 226
	i32 295, ; 227
	i32 279, ; 228
	i32 231, ; 229
	i32 294, ; 230
	i32 217, ; 231
	i32 242, ; 232
	i32 364, ; 233
	i32 351, ; 234
	i32 85, ; 235
	i32 386, ; 236
	i32 284, ; 237
	i32 61, ; 238
	i32 391, ; 239
	i32 112, ; 240
	i32 335, ; 241
	i32 379, ; 242
	i32 57, ; 243
	i32 329, ; 244
	i32 271, ; 245
	i32 99, ; 246
	i32 206, ; 247
	i32 191, ; 248
	i32 19, ; 249
	i32 235, ; 250
	i32 111, ; 251
	i32 101, ; 252
	i32 102, ; 253
	i32 408, ; 254
	i32 297, ; 255
	i32 369, ; 256
	i32 104, ; 257
	i32 289, ; 258
	i32 71, ; 259
	i32 396, ; 260
	i32 38, ; 261
	i32 32, ; 262
	i32 103, ; 263
	i32 73, ; 264
	i32 303, ; 265
	i32 9, ; 266
	i32 123, ; 267
	i32 46, ; 268
	i32 219, ; 269
	i32 186, ; 270
	i32 9, ; 271
	i32 43, ; 272
	i32 4, ; 273
	i32 272, ; 274
	i32 307, ; 275
	i32 365, ; 276
	i32 302, ; 277
	i32 31, ; 278
	i32 138, ; 279
	i32 92, ; 280
	i32 93, ; 281
	i32 322, ; 282
	i32 202, ; 283
	i32 49, ; 284
	i32 141, ; 285
	i32 112, ; 286
	i32 140, ; 287
	i32 241, ; 288
	i32 204, ; 289
	i32 115, ; 290
	i32 290, ; 291
	i32 157, ; 292
	i32 409, ; 293
	i32 76, ; 294
	i32 79, ; 295
	i32 261, ; 296
	i32 37, ; 297
	i32 283, ; 298
	i32 188, ; 299
	i32 352, ; 300
	i32 396, ; 301
	i32 175, ; 302
	i32 245, ; 303
	i32 238, ; 304
	i32 64, ; 305
	i32 138, ; 306
	i32 15, ; 307
	i32 375, ; 308
	i32 116, ; 309
	i32 277, ; 310
	i32 286, ; 311
	i32 379, ; 312
	i32 233, ; 313
	i32 48, ; 314
	i32 70, ; 315
	i32 80, ; 316
	i32 126, ; 317
	i32 94, ; 318
	i32 121, ; 319
	i32 26, ; 320
	i32 337, ; 321
	i32 254, ; 322
	i32 97, ; 323
	i32 28, ; 324
	i32 228, ; 325
	i32 320, ; 326
	i32 298, ; 327
	i32 149, ; 328
	i32 169, ; 329
	i32 335, ; 330
	i32 4, ; 331
	i32 98, ; 332
	i32 33, ; 333
	i32 93, ; 334
	i32 276, ; 335
	i32 181, ; 336
	i32 397, ; 337
	i32 21, ; 338
	i32 41, ; 339
	i32 170, ; 340
	i32 314, ; 341
	i32 367, ; 342
	i32 247, ; 343
	i32 340, ; 344
	i32 306, ; 345
	i32 261, ; 346
	i32 293, ; 347
	i32 286, ; 348
	i32 266, ; 349
	i32 2, ; 350
	i32 134, ; 351
	i32 111, ; 352
	i32 377, ; 353
	i32 411, ; 354
	i32 182, ; 355
	i32 352, ; 356
	i32 326, ; 357
	i32 210, ; 358
	i32 393, ; 359
	i32 323, ; 360
	i32 58, ; 361
	i32 226, ; 362
	i32 376, ; 363
	i32 95, ; 364
	i32 305, ; 365
	i32 39, ; 366
	i32 406, ; 367
	i32 221, ; 368
	i32 411, ; 369
	i32 25, ; 370
	i32 94, ; 371
	i32 89, ; 372
	i32 99, ; 373
	i32 10, ; 374
	i32 206, ; 375
	i32 399, ; 376
	i32 87, ; 377
	i32 359, ; 378
	i32 334, ; 379
	i32 100, ; 380
	i32 389, ; 381
	i32 273, ; 382
	i32 177, ; 383
	i32 366, ; 384
	i32 212, ; 385
	i32 189, ; 386
	i32 388, ; 387
	i32 302, ; 388
	i32 7, ; 389
	i32 174, ; 390
	i32 258, ; 391
	i32 297, ; 392
	i32 209, ; 393
	i32 88, ; 394
	i32 253, ; 395
	i32 154, ; 396
	i32 301, ; 397
	i32 33, ; 398
	i32 368, ; 399
	i32 116, ; 400
	i32 199, ; 401
	i32 202, ; 402
	i32 82, ; 403
	i32 208, ; 404
	i32 190, ; 405
	i32 345, ; 406
	i32 373, ; 407
	i32 20, ; 408
	i32 369, ; 409
	i32 11, ; 410
	i32 162, ; 411
	i32 3, ; 412
	i32 195, ; 413
	i32 309, ; 414
	i32 185, ; 415
	i32 182, ; 416
	i32 84, ; 417
	i32 296, ; 418
	i32 64, ; 419
	i32 184, ; 420
	i32 311, ; 421
	i32 280, ; 422
	i32 143, ; 423
	i32 402, ; 424
	i32 395, ; 425
	i32 357, ; 426
	i32 262, ; 427
	i32 157, ; 428
	i32 41, ; 429
	i32 117, ; 430
	i32 178, ; 431
	i32 211, ; 432
	i32 305, ; 433
	i32 269, ; 434
	i32 408, ; 435
	i32 131, ; 436
	i32 364, ; 437
	i32 75, ; 438
	i32 66, ; 439
	i32 315, ; 440
	i32 172, ; 441
	i32 331, ; 442
	i32 215, ; 443
	i32 143, ; 444
	i32 391, ; 445
	i32 106, ; 446
	i32 151, ; 447
	i32 190, ; 448
	i32 70, ; 449
	i32 156, ; 450
	i32 187, ; 451
	i32 177, ; 452
	i32 121, ; 453
	i32 127, ; 454
	i32 346, ; 455
	i32 310, ; 456
	i32 152, ; 457
	i32 244, ; 458
	i32 410, ; 459
	i32 226, ; 460
	i32 141, ; 461
	i32 231, ; 462
	i32 307, ; 463
	i32 20, ; 464
	i32 14, ; 465
	i32 135, ; 466
	i32 390, ; 467
	i32 75, ; 468
	i32 59, ; 469
	i32 234, ; 470
	i32 347, ; 471
	i32 167, ; 472
	i32 168, ; 473
	i32 193, ; 474
	i32 15, ; 475
	i32 74, ; 476
	i32 6, ; 477
	i32 378, ; 478
	i32 23, ; 479
	i32 358, ; 480
	i32 256, ; 481
	i32 209, ; 482
	i32 91, ; 483
	i32 333, ; 484
	i32 308, ; 485
	i32 1, ; 486
	i32 136, ; 487
	i32 367, ; 488
	i32 363, ; 489
	i32 257, ; 490
	i32 279, ; 491
	i32 134, ; 492
	i32 69, ; 493
	i32 146, ; 494
	i32 400, ; 495
	i32 317, ; 496
	i32 296, ; 497
	i32 248, ; 498
	i32 183, ; 499
	i32 88, ; 500
	i32 96, ; 501
	i32 238, ; 502
	i32 243, ; 503
	i32 312, ; 504
	i32 31, ; 505
	i32 45, ; 506
	i32 252, ; 507
	i32 187, ; 508
	i32 392, ; 509
	i32 333, ; 510
	i32 211, ; 511
	i32 109, ; 512
	i32 158, ; 513
	i32 35, ; 514
	i32 295, ; 515
	i32 22, ; 516
	i32 114, ; 517
	i32 57, ; 518
	i32 277, ; 519
	i32 343, ; 520
	i32 403, ; 521
	i32 144, ; 522
	i32 118, ; 523
	i32 120, ; 524
	i32 110, ; 525
	i32 339, ; 526
	i32 213, ; 527
	i32 139, ; 528
	i32 219, ; 529
	i32 387, ; 530
	i32 54, ; 531
	i32 394, ; 532
	i32 105, ; 533
	i32 318, ; 534
	i32 207, ; 535
	i32 395, ; 536
	i32 194, ; 537
	i32 195, ; 538
	i32 133, ; 539
	i32 292, ; 540
	i32 282, ; 541
	i32 270, ; 542
	i32 377, ; 543
	i32 324, ; 544
	i32 248, ; 545
	i32 197, ; 546
	i32 159, ; 547
	i32 303, ; 548
	i32 235, ; 549
	i32 163, ; 550
	i32 132, ; 551
	i32 270, ; 552
	i32 381, ; 553
	i32 161, ; 554
	i32 316, ; 555
	i32 259, ; 556
	i32 140, ; 557
	i32 282, ; 558
	i32 278, ; 559
	i32 169, ; 560
	i32 196, ; 561
	i32 175, ; 562
	i32 214, ; 563
	i32 288, ; 564
	i32 40, ; 565
	i32 246, ; 566
	i32 81, ; 567
	i32 348, ; 568
	i32 56, ; 569
	i32 37, ; 570
	i32 97, ; 571
	i32 166, ; 572
	i32 172, ; 573
	i32 283, ; 574
	i32 382, ; 575
	i32 82, ; 576
	i32 216, ; 577
	i32 199, ; 578
	i32 98, ; 579
	i32 30, ; 580
	i32 159, ; 581
	i32 403, ; 582
	i32 345, ; 583
	i32 18, ; 584
	i32 227, ; 585
	i32 127, ; 586
	i32 119, ; 587
	i32 242, ; 588
	i32 375, ; 589
	i32 273, ; 590
	i32 224, ; 591
	i32 255, ; 592
	i32 227, ; 593
	i32 275, ; 594
	i32 349, ; 595
	i32 165, ; 596
	i32 250, ; 597
	i32 412, ; 598
	i32 398, ; 599
	i32 224, ; 600
	i32 378, ; 601
	i32 272, ; 602
	i32 263, ; 603
	i32 170, ; 604
	i32 16, ; 605
	i32 144, ; 606
	i32 309, ; 607
	i32 189, ; 608
	i32 125, ; 609
	i32 118, ; 610
	i32 38, ; 611
	i32 115, ; 612
	i32 47, ; 613
	i32 205, ; 614
	i32 188, ; 615
	i32 142, ; 616
	i32 117, ; 617
	i32 34, ; 618
	i32 176, ; 619
	i32 200, ; 620
	i32 95, ; 621
	i32 344, ; 622
	i32 53, ; 623
	i32 264, ; 624
	i32 339, ; 625
	i32 129, ; 626
	i32 153, ; 627
	i32 24, ; 628
	i32 336, ; 629
	i32 161, ; 630
	i32 241, ; 631
	i32 148, ; 632
	i32 104, ; 633
	i32 374, ; 634
	i32 89, ; 635
	i32 228, ; 636
	i32 60, ; 637
	i32 142, ; 638
	i32 100, ; 639
	i32 355, ; 640
	i32 5, ; 641
	i32 13, ; 642
	i32 122, ; 643
	i32 386, ; 644
	i32 135, ; 645
	i32 28, ; 646
	i32 304, ; 647
	i32 72, ; 648
	i32 239, ; 649
	i32 24, ; 650
	i32 380, ; 651
	i32 221, ; 652
	i32 268, ; 653
	i32 265, ; 654
	i32 354, ; 655
	i32 321, ; 656
	i32 137, ; 657
	i32 214, ; 658
	i32 236, ; 659
	i32 168, ; 660
	i32 269, ; 661
	i32 300, ; 662
	i32 101, ; 663
	i32 123, ; 664
	i32 240, ; 665
	i32 343, ; 666
	i32 174, ; 667
	i32 223, ; 668
	i32 223, ; 669
	i32 179, ; 670
	i32 163, ; 671
	i32 167, ; 672
	i32 243, ; 673
	i32 39, ; 674
	i32 349, ; 675
	i32 336, ; 676
	i32 192, ; 677
	i32 402, ; 678
	i32 308, ; 679
	i32 17, ; 680
	i32 171, ; 681
	i32 321, ; 682
	i32 344, ; 683
	i32 346, ; 684
	i32 320, ; 685
	i32 137, ; 686
	i32 150, ; 687
	i32 232, ; 688
	i32 155, ; 689
	i32 130, ; 690
	i32 366, ; 691
	i32 19, ; 692
	i32 65, ; 693
	i32 332, ; 694
	i32 147, ; 695
	i32 47, ; 696
	i32 342, ; 697
	i32 328, ; 698
	i32 212, ; 699
	i32 79, ; 700
	i32 362, ; 701
	i32 393, ; 702
	i32 61, ; 703
	i32 106, ; 704
	i32 267, ; 705
	i32 381, ; 706
	i32 216, ; 707
	i32 405, ; 708
	i32 49, ; 709
	i32 253, ; 710
	i32 361, ; 711
	i32 325, ; 712
	i32 264, ; 713
	i32 14, ; 714
	i32 178, ; 715
	i32 68, ; 716
	i32 404, ; 717
	i32 171, ; 718
	i32 383, ; 719
	i32 225, ; 720
	i32 409, ; 721
	i32 350, ; 722
	i32 222, ; 723
	i32 232, ; 724
	i32 338, ; 725
	i32 390, ; 726
	i32 330, ; 727
	i32 365, ; 728
	i32 78, ; 729
	i32 361, ; 730
	i32 237, ; 731
	i32 392, ; 732
	i32 108, ; 733
	i32 215, ; 734
	i32 263, ; 735
	i32 67, ; 736
	i32 63, ; 737
	i32 384, ; 738
	i32 27, ; 739
	i32 160, ; 740
	i32 184, ; 741
	i32 229, ; 742
	i32 10, ; 743
	i32 192, ; 744
	i32 11, ; 745
	i32 198, ; 746
	i32 363, ; 747
	i32 173, ; 748
	i32 78, ; 749
	i32 126, ; 750
	i32 83, ; 751
	i32 398, ; 752
	i32 331, ; 753
	i32 180, ; 754
	i32 66, ; 755
	i32 107, ; 756
	i32 65, ; 757
	i32 128, ; 758
	i32 122, ; 759
	i32 368, ; 760
	i32 77, ; 761
	i32 278, ; 762
	i32 268, ; 763
	i32 329, ; 764
	i32 8, ; 765
	i32 236, ; 766
	i32 2, ; 767
	i32 230, ; 768
	i32 200, ; 769
	i32 44, ; 770
	i32 281, ; 771
	i32 156, ; 772
	i32 128, ; 773
	i32 266, ; 774
	i32 23, ; 775
	i32 359, ; 776
	i32 133, ; 777
	i32 218, ; 778
	i32 255, ; 779
	i32 203, ; 780
	i32 324, ; 781
	i32 306, ; 782
	i32 29, ; 783
	i32 217, ; 784
	i32 62, ; 785
	i32 342, ; 786
	i32 194, ; 787
	i32 90, ; 788
	i32 87, ; 789
	i32 148, ; 790
	i32 407, ; 791
	i32 196, ; 792
	i32 36, ; 793
	i32 86, ; 794
	i32 244, ; 795
	i32 319, ; 796
	i32 371, ; 797
	i32 314, ; 798
	i32 179, ; 799
	i32 50, ; 800
	i32 6, ; 801
	i32 191, ; 802
	i32 376, ; 803
	i32 90, ; 804
	i32 326, ; 805
	i32 21, ; 806
	i32 162, ; 807
	i32 96, ; 808
	i32 50, ; 809
	i32 113, ; 810
	i32 260, ; 811
	i32 410, ; 812
	i32 130, ; 813
	i32 0, ; 814
	i32 76, ; 815
	i32 27, ; 816
	i32 237, ; 817
	i32 259, ; 818
	i32 7, ; 819
	i32 350, ; 820
	i32 382, ; 821
	i32 193, ; 822
	i32 110, ; 823
	i32 260, ; 824
	i32 246 ; 825
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
