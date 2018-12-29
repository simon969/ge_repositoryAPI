using System;
using System.Collections.Generic;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Extensions;
using ge_repository.DAL;

namespace ge_repository.DAL {


public class ProjectionSystem {
        public ProjectionSystem() {

        }
        public ige_projectionDAL getProjectionDAL(_ge_location loc) {
            
            Constants.datumProjection dp = loc.datumProjection;
            
            switch(dp) { 
                        case Constants.datumProjection.OSGB36NG: 
                        return new ge_projectionOSGB36(loc);

                        case Constants.datumProjection.OSGB36NGODN:
                        return new ge_projectionOSGB36(loc);
                        
                        case Constants.datumProjection.WGS84:
                        return new ge_projectionWGS84(loc);

                        case Constants.datumProjection.GRS80:
                        return new ge_projectionGRS80(loc);
                        
                        default: 
                        return null;
            }

       }
    
    }

    public abstract class _ge_projectionDAL : ige_projectionDAL {
    public ge_conversion gc {get;set;}
    public _ge_location loc {get;set;}
    private string msg {get;set;}

    public _ge_projectionDAL(_ge_location Loc ){
        gc = new ge_conversion();
        loc = Loc;
    }
    public bool calcXYZ_fromLatLong(){
    return true;
    }
    public string getMessage(){
        return msg;
    }
    public void addMessage(string s1) {
        msg +=  s1;
    } 
    public void clearMessage() {
        msg="";
    }

        public bool calcLatLong_fromXYZ(){
         try {
            if (true) {


            } else {
      //       throw new System.ArgumentException("Latitude/Longitude Conversion Error", "Cannot convert XYZ (" + loc.X + "," + loc.Y+ "," +loc.Z + ")";
            }

        return true; 

        } catch (Exception e) {
            Console.Write (e.Message);
            return false;
        }
    } 
    public virtual Constants.datumProjection datumProjection(){return  Constants.datumProjection.NONE;}
    public void Dispose(){}
    public bool updateAll(){
        
        if (loc==null) {
            return false;
        } 
        
        if (loc.locMapReference != null) {
            if (updateAll("MapRef")){
                addMessage("Updated other coordinate systems values based on MapRef (" + loc.locMapReference + ")");
                return true;
            } else
            {
                addMessage ("Unable to updated other coordinate systems values based on MapRef (" + loc.locMapReference + ")");
                return false;
            }
        }

        if (loc.locEast != null && loc.locNorth!=null) {
          if (updateAll("EN")){
                addMessage ("Updated other coordinate systems values based on Easting and Northing (" + loc.locEast + "," + loc.locNorth + ")");
                return true;
            } else
            {
                addMessage ("Unable to updated other coordinate systems values based on Easting and Northing (" + loc.locEast + "," + loc.locNorth + ")");
                return false;
            }
        }
        
        if (loc.locLatitude != null && loc.locLongitude !=null) {
           if (updateAll("LatLong")){
                addMessage ("Updated other coordinate systems values based on Latitude and Longitude (" + loc.locLatitude + "," + loc.locLongitude + ")");
                return true;
            } else
            {
                addMessage ("Unable to updated other coordinate systems values based on Latitude and Longitude (" + loc.locLatitude + "," + loc.locLongitude + ")");
                return false;
            }
        }
        
      
        return true;
    }
    public bool updateAll(string sourceCoordSystem) {

        switch (sourceCoordSystem) {

                case "MapRef": 
                calcEN_fromMapRef();
                calcLatLong_fromEN();
                calcXYZ_fromLatLong();
                return true;

                case "EN":
                calcMapRef_fromEN ();
                calcLatLong_fromEN ();
                calcXYZ_fromLatLong ();
                return true;

                case "LatLong":
                calcXYZ_fromLatLong ();
                calcEN_fromLatLong ();
                calcMapRef_fromEN ();
                return true;

                case "XYZ":
                calcLatLong_fromXYZ (); 
                calcEN_fromLatLong ();
                calcMapRef_fromEN ();
                return true;

                default:
                return false;
        }
    }

    public bool calcEN_fromMapRef() {
     
        // remove any spaces
        loc.locMapReference.Replace(" ","");
        
        if (setEastingsNorthingsFromLetters()) {
            if (loc.locMapReference.Length == 8){
                loc.locEast  =+ int.Parse(loc.locMapReference.Substring(2,4));
                loc.locNorth =+ int.Parse(loc.locMapReference.Substring(5,7));
                return true;
            }
            
            if (loc.locMapReference.Length == 12){
                loc.locEast  =+ int.Parse(loc.locMapReference.Substring(2,6));
                loc.locNorth =+ int.Parse(loc.locMapReference.Substring(7,11));
                return true;
            }

            return false;
        }
    return false;
    }
    
    private Boolean setEastingsNorthingsFromLetters () {

      //  https://www.ordnancesurvey.co.uk/docs/support/national-grid-map-references.pdf
        
        string letters;

        letters = loc.locMapReference.Substring(0,1).ToUpper(); 
        
        switch (letters) 
        {
            case "SV": loc.locEast=0;      loc.locNorth=0; return true;
            case "SW": loc.locEast=100000; loc.locNorth=0; return true;
            case "SX": loc.locEast=200000; loc.locNorth=0; return true;
            case "SY": loc.locEast=300000; loc.locNorth=0; return true;
            case "SZ": loc.locEast=400000; loc.locNorth=0; return true;
            case "TV": loc.locEast=500000; loc.locNorth=0; return true;     
            
            case "SR": loc.locEast=100000; loc.locNorth=100000; return true;
            case "SS": loc.locEast=200000; loc.locNorth=100000; return true;
            case "ST": loc.locEast=300000; loc.locNorth=100000; return true;
            case "SU": loc.locEast=400000; loc.locNorth=100000; return true;
            case "TQ": loc.locEast=500000; loc.locNorth=100000; return true;
            case "TR": loc.locEast=600000; loc.locNorth=100000; return true;
            
            case "SM": loc.locEast=100000; loc.locNorth=200000; return true;
            case "SN": loc.locEast=200000; loc.locNorth=200000; return true;
            case "SO": loc.locEast=300000; loc.locNorth=200000; return true;
            case "SP": loc.locEast=400000; loc.locNorth=200000; return true;
            case "TL": loc.locEast=500000; loc.locNorth=200000; return true;
            case "TM": loc.locEast=600000; loc.locNorth=200000; return true;     
            
            case "SH": loc.locEast=200000; loc.locNorth=300000; return true;
            case "SJ": loc.locEast=300000; loc.locNorth=300000; return true;
            case "SK": loc.locEast=400000; loc.locNorth=300000; return true;
            case "TF": loc.locEast=500000; loc.locNorth=300000; return true;
            case "TG": loc.locEast=600000; loc.locNorth=300000; return true;

            case "SC": loc.locEast=200000; loc.locNorth=400000; return true;
            case "SD": loc.locEast=300000; loc.locNorth=400000; return true;
            case "SE": loc.locEast=400000; loc.locNorth=400000; return true;
            case "TA": loc.locEast=500000; loc.locNorth=400000; return true;

            case "NW": loc.locEast=100000; loc.locNorth=500000; return true;
            case "NX": loc.locEast=200000; loc.locNorth=500000; return true;
            case "NY": loc.locEast=300000; loc.locNorth=500000; return true;
            case "NZ": loc.locEast=400000; loc.locNorth=500000; return true;

            case "NR": loc.locEast=100000; loc.locNorth=600000; return true;
            case "NS": loc.locEast=200000; loc.locNorth=600000; return true;
            case "NT": loc.locEast=300000; loc.locNorth=600000; return true;
            case "NU": loc.locEast=400000; loc.locNorth=600000; return true;
               
            case "NL": loc.locEast=000000; loc.locNorth=700000; return true;
            case "NM": loc.locEast=100000; loc.locNorth=700000; return true;
            case "NN": loc.locEast=200000; loc.locNorth=700000; return true;
            case "NO": loc.locEast=300000; loc.locNorth=700000; return true;
            
            case "NF": loc.locEast=000000; loc.locNorth=800000; return true;
            case "NG": loc.locEast=100000; loc.locNorth=800000; return true;
            case "NH": loc.locEast=200000; loc.locNorth=800000; return true;
            case "NJ": loc.locEast=300000; loc.locNorth=800000; return true;        
            case "NK": loc.locEast=400000; loc.locNorth=800000; return true; 

            case "NA": loc.locEast=000000; loc.locNorth=900000; return true;
            case "NB": loc.locEast=100000; loc.locNorth=900000; return true;
            case "NC": loc.locEast=200000; loc.locNorth=900000; return true;
            case "ND": loc.locEast=300000; loc.locNorth=900000; return true;

            case "HW": loc.locEast=100000; loc.locNorth=1000000; return true;
            case "HX": loc.locEast=200000; loc.locNorth=1000000; return true;
            case "HY": loc.locEast=300000; loc.locNorth=1000000; return true;
            case "HZ": loc.locEast=400000; loc.locNorth=1000000; return true; 
            
            case "HT": loc.locEast=300000; loc.locNorth=1100000; return true;
            case "HU": loc.locEast=400000; loc.locNorth=1100000; return true;
            
            case "HP": loc.locEast=400000; loc.locNorth=1200000; return true; 
        }
        
        return false;
        
    }
    public bool calcMapRef_fromEN(){return false;}

    public bool getMapLettersFromEastNorth(){
        
        if (loc.locEast == null && loc.locNorth == null) {
            return false;
        }

        try {

            int locEastGrid = (int) Math.Floor(loc.locEast.Value/100000.0) * 100000;
            int locNorthGrid = (int) Math.Floor(loc.locNorth.Value/100000.0) * 100000;
          
            double locEastOffset = loc.locEast.Value-locEastGrid;
            double locNorthOffset = loc.locNorth.Value-locNorthGrid;

            string E_N =  locEastGrid.ToString() + '_' + locNorthGrid.ToString();
            string retGrid = "";

            switch (E_N) {

                case "0_0": retGrid= "SV"; break;
                case "100000_0": retGrid= "SW"; break;
                case "200000_0": retGrid= "SX"; break;
                case "300000_0": retGrid= "SY"; break;
                case "400000_0": retGrid= "SZ"; break;
                case "500000_0": retGrid= "TV"; break;

                case "100000_100000": retGrid= "SR"; break;
                case "200000_100000": retGrid= "SS"; break;
                case "300000_100000": retGrid= "ST"; break;
                case "400000_100000": retGrid= "SU"; break;
                case "500000_100000": retGrid= "TQ"; break;
                case "600000_100000": retGrid= "TR"; break;
                
                case "100000_200000": retGrid= "SM"; break;
                case "200000_200000": retGrid= "SN"; break;
                case "300000_200000": retGrid= "SO"; break;
                case "400000_200000": retGrid= "SP"; break;
                case "500000_200000": retGrid= "TL"; break;
                case "600000_200000": retGrid= "TM"; break;

                case "200000_300000": retGrid= "SH"; break;
                case "300000_300000": retGrid= "SJ"; break;
                case "400000_300000": retGrid= "SK"; break;
                case "500000_300000": retGrid= "TF"; break;
                case "600000_300000": retGrid= "TG"; break;

                case "200000_400000": retGrid= "SC"; break;
                case "300000_400000": retGrid= "SD"; break;
                case "400000_400000": retGrid= "SE"; break;
                case "500000_400000": retGrid= "TA"; break;
                
                case "100000_500000": retGrid= "NW"; break;
                case "200000_500000": retGrid= "NX"; break;
                case "300000_500000": retGrid= "NY"; break;
                case "400000_500000": retGrid= "NZ"; break;

                case "100000_600000": retGrid= "NR"; break;
                case "200000_600000": retGrid= "NS"; break;
                case "300000_600000": retGrid= "NT"; break;
                case "400000_600000": retGrid= "NU"; break;
            
                case "000000_700000": retGrid= "NL"; break;
                case "100000_700000": retGrid= "NM"; break;
                case "200000_700000": retGrid= "NN"; break;
                case "300000_700000": retGrid= "NO"; break;
            
                case "000000_800000": retGrid= "NF"; break;
                case "100000_800000": retGrid= "NG"; break;
                case "200000_800000": retGrid= "NH"; break;
                case "300000_800000": retGrid= "NJ"; break;
                case "400000_800000": retGrid= "NK"; break;

                case "000000_900000": retGrid= "NA"; break;
                case "100000_900000": retGrid= "NB"; break;
                case "200000_900000": retGrid= "NC"; break;
                case "300000_900000": retGrid= "ND"; break;

                case "100000_1000000": retGrid= "HW"; break;
                case "200000_1000000": retGrid= "HX"; break;
                case "300000_1000000": retGrid= "HY"; break;
                case "400000_1000000": retGrid= "HZ"; break;

                case "300000_11000000": retGrid= "HT"; break;
                case "400000_11000000": retGrid= "HU"; break;         

                case "400000_12000000": retGrid= "HP"; break;

                default: retGrid = null; break;
            }
        
        loc.locMapReference = retGrid + locEastOffset.ToString() + locNorthOffset.ToString();
            return true;
        } catch(Exception e) {
            Console.WriteLine(e.ToString());
            return false;
        }

    }

    
    public bool calcEN_fromLatLong(){
        
        if (loc.locLongitude==null || loc.locLatitude==null) {
            return false;
        }

        try {

        loc.locEast= gc.Lat_Long_to_East(loc.locLatitude.Value,loc.locLongitude.Value);
        loc.locNorth= gc.Lat_Long_to_North(loc.locLatitude.Value,loc.locLongitude.Value);
        return true;
        
        } 
        
        catch {
       // throw new System.ArgumentException("Latitude/Longitude Conversion Error", "Cannot convert locEast:" + loc.locEast + ";locNorth:" + loc.locNorth);
        return false;     
        }
    }
    public bool calcLatLong_fromEN(){
        
        if (loc.locEast==null || loc.locNorth==null) {
            return false;
        }

        loc.locLatitude= gc.E_N_to_Lat(loc.locEast.Value,loc.locNorth.Value);
        loc.locLongitude= gc.E_N_to_Long(loc.locEast.Value,loc.locNorth.Value);
        return true;
    }
    }

 public class ge_projectionOSGB36 : _ge_projectionDAL {
  
    public ge_projectionOSGB36(_ge_location Loc): base(Loc) {

        ge_projection_factors pf = new ge_projection_factors();
        pf.a = 6377563.3960;
        pf.b = 6356256.9090;
        pf.f0 = 0.999601271700;
        pf.e0 = 400000.000;
        pf.n0 = -100000.000;
        pf.PHI0 = 49.000;
        pf.LAM0 = -2.000;

        gc.pf = pf;
    }
     public override Constants.datumProjection datumProjection(){return  Constants.datumProjection.OSGB36NG;}
}
 public class ge_projectionWGS84 : _ge_projectionDAL {
  
    public ge_projectionWGS84(_ge_location Loc): base(Loc) {  

        ge_projection_factors pf = new ge_projection_factors();     
        
        pf.a = 6378137.0000;
        pf.b = 6356752.3142;
        pf.f0 = 0.999601271700;
        pf.e0 = 400000.000;
        pf.n0 = -100000.000;
        pf.PHI0 = 49.000;
        pf.LAM0 = -2.000;
        
        gc.pf = pf;
    }
    public override Constants.datumProjection datumProjection(){return  Constants.datumProjection.WGS84;}
}
 public class ge_projectionGRS80 : _ge_projectionDAL {
  
    public ge_projectionGRS80(_ge_location Loc): base(Loc) {  

        ge_projection_factors pf = new ge_projection_factors();  
        
        pf.a = 6378137.0000;
        pf.b = 6356752.3141;
        pf.f0 = 0.999601271700;
        pf.e0 = 400000.000;
        pf.n0 = -100000.000;
        pf.PHI0 = 49.000;
        pf.LAM0 = -2.000;

        gc.pf = pf;
    }
     public override Constants.datumProjection datumProjection(){return  Constants.datumProjection.GRS80;}
}

}





