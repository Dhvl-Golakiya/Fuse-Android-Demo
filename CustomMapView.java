package com.apps.mymapbox;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.DatePicker;
import android.widget.FrameLayout;

import com.mapbox.mapboxsdk.Mapbox;
import com.mapbox.mapboxsdk.camera.CameraPosition;
import com.mapbox.mapboxsdk.constants.Style;
import com.mapbox.mapboxsdk.geometry.LatLng;
import com.mapbox.mapboxsdk.maps.MapView;
import com.mapbox.mapboxsdk.maps.MapboxMapOptions;


/**
 * Created by dhvlsimac on 14/08/17.
 */

public class CustomMapView extends FrameLayout {
    
    private MapView mMapView;
    Context context;
    
    public CustomMapView(Context context) {
        super(context);
        this.context = context;
        addMapboxView();
    }
    
    void addMapboxView() {
        CameraPosition position = new CameraPosition.Builder()
        .target(new LatLng(39.7468, -104.9923)) // Sets the new camera position
        .zoom(13) // Sets the zoom to level 10
        .build(); // Builds the CameraPosition object from the builder
        MapboxMapOptions options = new MapboxMapOptions();
        options.camera(position);
        options.styleUrl(Style.OUTDOORS);
        mMapView = new com.mapbox.mapboxsdk.maps.MapView(context, options);
        mMapView.getMapAsync(new OnMapReadyCallback() {
            @Override
            public void onMapReady(MapboxMap mapboxMap) {
                mapboxMap.setOnMapClickListener(new MapboxMap.OnMapClickListener() {
                    @Override
                    public void onMapClick(@NonNull LatLng point) {
                        
                    }
                });
            }
        });
        this.addView(mMapView);

    }

}
