using Uno;
using Uno.UX;
using Uno.Time;
using Uno.Compiler.ExportTargetInterop;
using Fuse;
using Fuse.Controls;
using Fuse.Controls.Native;
using Fuse.Controls.Native.Android;

namespace Native.Android
{
	[Require("Gradle.Dependency","compile('com.mapbox.mapboxsdk:mapbox-android-sdk:5.1.2@aar') { transitive=true }")]
	[Require("Gradle.Repository","mavenCentral()")]	
	[ForeignInclude(Language.Java, "com.apps.mymapbox.CustomMapView")]	
	[ForeignInclude(Language.Java, "com.mapbox.mapboxsdk.Mapbox")]	

	extern(Android) public class MyMapBox : Fuse.Controls.Native.Android.LeafView, MyMapBoxView
	{
		MyMapBoxDelegate _host;

		[UXConstructor]
		public MyMapBox([UXParameter("Host")]MyMapBoxDelegate host) : base(Create())
		{
			_host = host;
		}

		void MyMapBoxView.AddAnnotation(object annotation)
		{

		}

		void selectedAnnotation(string userName)
		{
			
		}

		[Foreign(Language.Java)]
		static Java.Object Create()
		@{
        	Mapbox.getInstance(@(Activity.Package).@(Activity.Name).GetRootActivity(), 
        	"<Map Box Key>");
        	return new CustomMapView(@(Activity.Package).@(Activity.Name).GetRootActivity());
		@}

	}

	  extern(!Mobile) public class MyMapBox
    {
        [UXConstructor]
        public MyMapBox([UXParameter("Host")]MyMapBoxDelegate host) { }
    }

}