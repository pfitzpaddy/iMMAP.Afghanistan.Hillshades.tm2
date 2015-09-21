// =====================================================================
// HEALTH FACILITIES
// =====================================================================

#afg_north_health_facilities_2012[FacType="Regional/National Hospital (H1)"] {
  marker-file: url("img/health/health-facility.svg");
  marker-width: 36;
}

// Provincial Hospitals (H2)

#afg_north_health_facilities_2012[FacType="Provincial Hospital (H2)"] {
  marker-file: url("img/health/health-facility.svg");
  marker-width: 32;
}

// District Hospitals (H3)

#afg_hpro_health_facilities[FacilityTy="District Hospital (H3)"],
  #afg_north_health_facilities_2012[FacType="District Hospital (H3)"] {
    marker-file: url("img/health/health-facility-post.svg");
    marker-width: 28;
}

// CHC

#afg_hpro_health_facilities[FacilityTy="CHC"],
  #afg_hpro_health_facilities[FacilityTy="Comphrensive Health Center (CHC)"],
  #afg_north_health_facilities_2012[FacType="Comphrensive Health Center (CHC)"] {
    marker-file: url("img/health/chc.svg");
    marker-width: 24;
}

// BHC

#afg_hpro_health_facilities[FacilityTy="BHC"],
  #afg_hpro_health_facilities[FacilityTy="Basic Health Center (BHC)"],
  #afg_north_health_facilities_2012[FacType="Basic Health Center (BHC)"] {
    marker-file: url("img/health/bhc.svg");
    marker-width: 22;
}

// SHC

#afg_hpro_health_facilities[FacilityTy="SC"],
  #afg_hpro_health_facilities[FacilityTy="SHC"],
  #afg_hpro_health_facilities[FacilityTy="Sub Health Center"],  
  #afg_hpro_health_facilities[FacilityTy="Sub Health Center (SHC)"],
  #afg_north_health_facilities_2012[FacType="Sub Health Center (SHC)"] {
    marker-file: url("img/health/shc.svg");
    marker-width: 20;
}