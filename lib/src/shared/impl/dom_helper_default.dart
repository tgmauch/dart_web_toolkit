//Copyright (C) 2012 Sergey Akopkokhyants. All Rights Reserved.
//Author: akserg

part of dart_web_toolkit_shared;

class DomHelperDefault implements DomHelper {

  void setEventListener(dart_html.Element elem, EventListener listener) {
    // Native JavaScript code
    //elem.__listener = listener;
  }

  bool isOrHasChild(dart_html.Node parent, dart_html.Node child) {
    return parent.contains(child);
  }

  int getAbsoluteLeft(dart_html.Element elem) {
    var left = 0;
    dart_html.Element curr = elem;
    // This intentionally excludes body which has a null offsetParent.
    while (curr.offsetParent != null) {
      left -= curr.scrollLeft;
      curr = curr.parent;
    }
    while (elem != null) {
      left += elem.offsetLeft;
      elem = elem.offsetParent;
    }
    return left;
  }

  int getAbsoluteTop(dart_html.Element elem) {
    var top = 0;
    dart_html.Element curr = elem;
    // This intentionally excludes body which has a null offsetParent.
    while (curr.offsetParent != null) {
      top -= curr.scrollTop;
      curr = curr.parentNode;
    }
    while (elem != null) {
      top += elem.offsetTop;
      elem = elem.offsetParent;
    }
    return top;
  }

  void insertChild(dart_html.Element parent, dart_html.Element toAdd, int index) {
    int count = 0;
    dart_html.Node child = parent.$dom_firstChild;
    dart_html.Node before;
    while (child != null) {
      if (child.nodeType == dart_html.Node.ELEMENT_NODE) {
        if (count == index) {
          before = child;
          break;
        }
        ++count;
      }
      child = child.nextNode; //nextSibling;
    }

    parent.insertBefore(toAdd, before);
  }

//*********
  // Capturte
  //*********

  void releaseCapture(dart_html.Element elem) {
//    maybeInitializeEventSystem();
//    releaseCaptureImpl(elem);
  }

  void setCapture(dart_html.Element elem) {
//    maybeInitializeEventSystem();
//    setCaptureImpl(elem);
  }

//*******
  // Events
  //*******

  void sinkBitlessEvent(dart_html.Element elem, String eventTypeName, dart_html.EventListener listener) {
    elem.on[eventTypeName].add(listener);
  }

  void sinkEvents(dart_html.Element elem, Set eventBits, dart_html.EventListener listener) {
    for (String eventName in eventBits) {
      elem.on[eventName].add(listener);
    }
  }
  
  void unsinkEvents(dart_html.Element elem, Set eventBits, dart_html.EventListener listener) {
    for (String eventName in eventBits) {
      elem.on[eventName].remove(listener);
    }
  }
}