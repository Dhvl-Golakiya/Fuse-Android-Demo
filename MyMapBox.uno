using Uno;
using Uno.Time;
using Uno.Compiler.ExportTargetInterop;
using Fuse.Controls;
using Fuse.Controls.Native;

namespace Native 
{
	public interface MyMapBoxDelegate 
	{
		void OnAnnotationClicked(int index);
	}

	public interface MyMapBoxView
	{
		void AddAnnotation(object annotation);
	}

	public partial class MyMapBox : Panel, MyMapBoxDelegate
	{
		MyMapBoxView MapBoxView
		{
			get { 
					debug_log "Called View ";

					return NativeView as MyMapBoxView; }
		}

		void MyMapBoxDelegate.OnAnnotationClicked(int index)
		{
			debug_log "Annotation Clicked " + index;
		}

		protected override IView CreateNativeView()
		{
			if defined(iOS)
			{
				return new Native.iOS.MyMapBox(this);
			}
			else if defined(Android)
			{
				return new Native.Android.MyMapBox(this);
			}
			else
			{
				return base.CreateNativeView();
			}
		}
	}
}

