// Common Colors //

@land: #efefef;
@water: #cdd;
@water_dark: #185869;  // for the inline/shadow
@crop: #eeeed4;
@grass: #e7ebd1;
@scrub: #e0e8cd;
@wood: #d4e2c6;
@snow: #f4f8ff;
@rock: #ddd;
@sand: mix(#ffd,@land,33%);
// These colors need to take `comp-op:multiply` into account:
@cemetery: #edf4ed;
@pitch: fadeout(#fff,50%);
@park: #edf9e4;
@piste: mix(blue,@land,5);
@school: #fbf6ff;
@hospital: #fff0f0;
@builtup: #f6faff;

// Background //

Map {
  background-color: @land;
}

// Hillshading //

#hillshade {
  ::0[zoom<=13],
  ::1[zoom=14],
  ::2[zoom>=15][zoom<=16],
  ::3[zoom>=17][zoom<=18],
  ::4[zoom>=19] {
    comp-op: hard-light;
    polygon-clip: false;
    image-filters-inflate: true;
    [class='shadow'] {
      polygon-fill: #1f1f20;
      polygon-comp-op: multiply;
      [zoom>=0][zoom<=3] { polygon-opacity: 0.10; }
      [zoom>=4][zoom<=5] { polygon-opacity: 0.08; }
      [zoom>=6][zoom<=14] { polygon-opacity: 0.06; }
      [zoom>=15][zoom<=16] { polygon-opacity: 0.04; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.02; }
      [zoom>=18] { polygon-opacity: 0.01; }
    }
    [class='highlight'] {
      polygon-fill: #ffd;
      polygon-opacity: 0.2;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.15; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.10; }
      [zoom>=18] { polygon-opacity: 0.05; }
    }
  }
  ::1 { image-filters: agg-stack-blur(2,2); }
  ::2 { image-filters: agg-stack-blur(8,8); }
  ::3 { image-filters: agg-stack-blur(16,16); }
  ::4 { image-filters: agg-stack-blur(32,32); }
}

// Elevation contours & labels //

// Multiple copies of the same layer have been made, each with
// unique classes and positions in the stack. This is done by
// editing the layers list in <project.yml>.

#contour.line::line[index!=-1] {
  line-color: #817a7a;
  line-opacity: 0.1;
  line-width: 1.2;
  [index>=5] {
    line-opacity: 0.22;
    line-width: 1.2;
  }
}

#contour.label::label {
  [zoom<=12][index>=5],
  [zoom>=13][zoom<=15][index=10],
  [zoom>=16][index>=5] {
    text-name: "[ele]+' m'";
    text-face-name: 'Open Sans Regular';
    text-placement: line;
    text-size: 10;
    text-fill: #666;
    text-opacity: 0.6;
    text-avoid-edges: true;
    text-halo-fill: fadeout(@crop,80%);
    text-halo-radius: 2;
    text-halo-rasterizer: fast;
  }
}

// Water Features //

#water {
  polygon-clip: false;
  polygon-fill: @water_dark;
  ::blur {
    // A second attachment that is blurred creates the effect of
    // an inline stroke on the water layer.
    image-filters: agg-stack-blur(1,1);
    image-filters-inflate: true;
    polygon-clip: false;
    polygon-fill: @water;
    polygon-gamma: 0.6;
    [zoom<6] { polygon-gamma: 0.4; }
  }
}

#afg_rivers[zoom>=10] {
  line-smooth: 0.6;
  line-cap: round;
  line-color: @water_dark;
  [HYC_DESCRI='Perennial/Permanent'] {
    [zoom>=10] { line-width: 1; }
    [zoom>=11] { line-width: 1.25; }
    [zoom>=12] { line-width: 1.5; }
    [zoom>=14] { line-width: 1.75; }
    [zoom>=16] { line-width: 2; }
  }
  [HYC_DESCRI='Non-Perennial/Intermittent/Fluctuating'] {
    [zoom>=10] { line-width: 0.5; }
    [zoom>=11] { line-width: 0.75; }
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 1.25; }
    [zoom>=16] { line-width: 1.5; }
  }  
  // A second attachment that is blurred creates the effect of
  // an inline stroke on the water layer.  
  ::blur {
    line-color: mix(@water,@water_dark,60);
    line-gamma: 0.6;
    [HYC_DESCRI='Perennial/Permanent'] {
      [zoom>=10] { line-width: 2; }
      [zoom>=11] { line-width: 2.5; }
      [zoom>=12] { line-width: 3; }
      [zoom>=14] { line-width: 3.5; }
      [zoom>=16] { line-width: 4; }
    }
    [HYC_DESCRI='Non-Perennial/Intermittent/Fluctuating'] {
      [zoom>=10] { line-width: 1; }
      [zoom>=11] { line-width: 1.5; }
      [zoom>=12] { line-width: 2; }
      [zoom>=14] { line-width: 2.5; }
      [zoom>=16] { line-width: 3; }
    }    
  }
}

// Aeroways //

// lines
#aeroway['mapnik::geometry_type'=2][zoom>9] {
  [type='runway'] {
    line-color:#ddd;
  	line-cap:square;
  	line-join:miter;
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:15; }
    [zoom=17]{ line-width:19; }
    [zoom>17]{ line-width:23; }
  }
  [type='taxiway'][zoom>=12] {
    line-color:#ddd;
  	line-cap:square;
  	line-join:miter;
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:2; }
    [zoom=16]{ line-width:3; }
    [zoom=17]{ line-width:4; }
    [zoom>17]{ line-width:5; }
  }
}

// polygons
#aeroway[type!='apron']['mapnik::geometry_type'=3][zoom>=13] {
  polygon-clip: false;
  polygon-fill: #ddd;
}

// Buildings //

#building {
  ::shadow[zoom>=16] {
    line-clip: false;
    line-join: round;
    line-cap: round;
    line-color: fadeout(#000, 85%);
    [zoom>=17] { line-width: 2; }
  }
  polygon-clip: false;
  polygon-fill: @land * 0.95;
  [zoom>=16] {
    polygon-geometry-transform: translate(-0.5,-1.2);
  }
}

// Political boundaries //

#afg_admin_1_boundary {
  polygon-opacity: 0;
  line-color: #666;
  line-width: 1;
}

#afg_admin_0_countries[iso_a2!="AF"] {
  line-width: 0.9;
  line-color: #fff;
  polygon-fill:#918b8b;
  polygon-opacity: 0.3;
  polygon-gamma: 0.5;
}

#afg_admin_2_provinces[zoom>=6] {
  line-width: 0.8;
  line-color: rgba(32, 34, 33, 0.4);
  [zoom>=9] {
    line-width: 1;
  }
}

#afg_admin_3_districts[zoom>=9] {
  line-width: 1;
  line-color: rgba(32, 34, 33,0.2);
}

/**/