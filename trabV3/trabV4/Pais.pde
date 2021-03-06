
//  exemplo de visualizacao de informacao
//  definicao da classe Pais

class Pais { 
  String primaryFemale;
  String secondaryFemale;
  String tertiaryFemale;

  float primaryFemaleValue;
  float secondaryFemaleValue;
  float tertiaryFemaleValue;

  String primaryMale;
  String secondaryMale;
  String tertiaryMale;

  float primaryMaleValue;
  float secondaryMaleValue;
  float tertiaryMaleValue;

  String nome;
  float lat;
  float lon;
  PImage iconBandeira;
  PImage imagemBandeira;

  Pais (String n, float la, float lo, PImage ic, PImage ib,
    String pf, String sf, String tf, 
    float pfv, float sfv, float tfv, 
    String pm, String sm, String tm, 
    float pmv, float smv, float tmv
    ) {
    nome = n;
    lat = la;
    lon = lo;
    iconBandeira = ic;
    imagemBandeira = ib;

    primaryMale = pm;
    secondaryMale = sm;
    tertiaryMale = tm;

    primaryMaleValue = pmv;
    secondaryMaleValue = smv;
    tertiaryMaleValue = tmv;

    primaryFemale = pf;
    secondaryFemale = sf;
    tertiaryFemale = tf;

    primaryFemaleValue = pfv;
    secondaryFemaleValue = sfv;
    tertiaryFemaleValue = tfv;
  }
  void desenhaMapa() {
    Location loc = new Location(lat, lon);
    ScreenPosition pos = map.getScreenPosition(loc);
    float malValuesMasc = primaryMaleValue + secondaryMaleValue + tertiaryMaleValue;
    float mapSalMasc = map(malValuesMasc, 0, 5000, 0, 500);


    float malValuesFem = primaryFemaleValue + secondaryFemaleValue + tertiaryFemaleValue;
    float mapSalFem = map(malValuesFem, 0, 5000, 0, 500);
    //noStroke();
    // circulo de salario
    fill(0,07,84, 50);
    ellipse (pos.x, pos.y, mapSalMasc, mapSalMasc); 
    fill(236,87,113,50);
    ellipse (pos.x, pos.y, mapSalFem, mapSalFem);
  }

  void desenhaInfo() {
    float malValuesMasc = primaryMaleValue + secondaryMaleValue + tertiaryMaleValue;
    float malValuesFem = primaryFemaleValue + secondaryFemaleValue + tertiaryFemaleValue;

    Location localizacaoMapa = new Location(lat, lon);

    ScreenPosition posicaoMapa = map.getScreenPosition(localizacaoMapa);

    float escala = map.getZoom();

    // vamos detectar se o mouse esta perto de um pais
    boolean estaSobRato = false;
    if (dist(mouseX, mouseY, posicaoMapa.x, posicaoMapa.y)<2*escala) {
      estaSobRato = true;

      //if (mousePressed) {    // se houver click na area da bola, guardamos ref do pais (nome) e alteramos seccao

      //println("rato");

      paisCandidato = nome;
      //seccaogeral = 2;
    }


    // se ocorrer mouseOver num pais, entao os circulos terao contorno
    if (estaSobRato) {
      stroke(0);
      strokeWeight(1);
    } else {
      noStroke();
    }
    
    //    fill(100, 140, 114, 100);
    //    fill(0, 140, 114,100);
    
    if (estaSobRato) {
      noStroke();

      fill(0);
      //text(nome + "\nLat: " + lat + "\nLon: " + lon + "\n" + masc + malValuesMasc + "\n" + fem + malValuesFem, mouseX+25, mouseY-5);
      text(nome + "\nLat: " + lat + "\nLon: " + lon + "\n Sum M: " + malValuesMasc + "\n Sum F: " + malValuesFem, mouseX+25, mouseY-5);
    }
  }

  void desenhaRato() {    
    fill(0);
    text("Coordenadas: " + mouseX + " " + mouseY, 650, 10);
  }

  void desenhaEdu(int x, int y) {
    text(nome+"\n", x+150, y+150);
  }
}
