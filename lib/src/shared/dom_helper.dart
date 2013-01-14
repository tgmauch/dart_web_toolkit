//Copyright (C) 2012 Sergey Akopkokhyants. All Rights Reserved.
//Author: akserg

part of dart_web_toolkit_shared;

abstract class DomHelper {

  /**
   * Create instance of [DomHelper] depends on broswer.
   */
  factory DomHelper.browserDependent() {
    return new DomHelperDefault();
  }

  bool isOrHasChild(dart_html.Node parent, dart_html.Node child);

  void setEventListener(dart_html.Element elem, EventListener listener);

  int getAbsoluteLeft(dart_html.Element elem);

  int getAbsoluteTop(dart_html.Element elem);

  void insertChild(dart_html.Element parent, dart_html.Element child, int index);

  //*********
  // Capturte
  //*********

  void releaseCapture(dart_html.Element elem);

  void setCapture(dart_html.Element elem);

//*******
  // Events
  //*******

  void sinkBitlessEvent(dart_html.Element elem, String eventTypeName, dart_html.EventListener listener);

  void sinkEvents(dart_html.Element elem, Set eventBits, dart_html.EventListener listener);
  
  void unsinkEvents(dart_html.Element elem, Set eventBits, dart_html.EventListener listener);
}
