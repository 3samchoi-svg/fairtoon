/* Fairtoon 로고 3차 — 만화책 + 컷 분할 형태 4종 × 합법 기호 6종 */
var BLUE="#2F5FEF", WHITE="#FFFFFF";

/* ───────── 합법 표현 배지 (우하단, 지름 26 기준) ───────── */
function badge(kind,fg,bg,cx,cy,scale){
  cx=cx||47; cy=cy||47; scale=scale||1;
  var R=13*scale, r=10.6*scale;
  var g='<circle cx="'+cx+'" cy="'+cy+'" r="'+R+'" fill="'+bg+'"/>'+
        '<circle cx="'+cx+'" cy="'+cy+'" r="'+r+'" fill="'+fg+'"/>';
  var s=function(v){return v*scale;};
  if(kind==="check"){
    g+='<path d="M'+(cx-4.7*scale)+' '+(cy+0.2*scale)+'l'+s(3.4)+' '+s(3.4)+'L'+(cx+5*scale)+' '+(cy-2.9*scale)+'" fill="none" stroke="'+bg+'" stroke-width="'+s(3.6)+'" stroke-linecap="round" stroke-linejoin="round"/>';
  }else if(kind==="heart"){
    g+='<path d="M'+cx+' '+(cy+5.2*scale)+
       'c-'+s(1.2)+'-'+s(1.1)+'-'+s(6.4)+'-'+s(4.3)+'-'+s(6.4)+'-'+s(7.9)+
       'a'+s(3.3)+' '+s(3.3)+' 0 0 1 '+s(6.4)+'-'+s(1.7)+
       'a'+s(3.3)+' '+s(3.3)+' 0 0 1 '+s(6.4)+' '+s(1.7)+
       'c0 '+s(3.6)+'-'+s(5.2)+' '+s(6.8)+'-'+s(6.4)+' '+s(7.9)+'z" fill="'+bg+'"/>';
  }else if(kind==="coin"){
    g+='<text x="'+cx+'" y="'+(cy+4.3*scale)+'" text-anchor="middle" fill="'+bg+
       '" font-family="Inter, sans-serif" font-weight="800" font-size="'+s(12.5)+'">₩</text>';
  }else if(kind==="scale"){
    g+='<path d="M'+(cx-6.4*scale)+' '+(cy-3.2*scale)+'H'+(cx+6.4*scale)+
       'M'+cx+' '+(cy-3.2*scale)+'V'+(cy+5.4*scale)+
       'M'+(cx-4.2*scale)+' '+(cy+5.4*scale)+'H'+(cx+4.2*scale)+'" fill="none" stroke="'+bg+
       '" stroke-width="'+s(2.5)+'" stroke-linecap="round"/>'+
       '<path d="M'+(cx-9*scale)+' '+(cy-0.4*scale)+'h'+s(5.6)+'l-'+s(2.8)+' '+s(3.6)+'z'+
       'M'+(cx+3.4*scale)+' '+(cy-0.4*scale)+'h'+s(5.6)+'l-'+s(2.8)+' '+s(3.6)+'z" fill="'+bg+'"/>';
  }else if(kind==="arrow"){
    g+='<path d="M'+(cx-5.6*scale)+' '+cy+'H'+(cx+4.6*scale)+
       'M'+(cx+1*scale)+' '+(cy-3.6*scale)+'L'+(cx+4.8*scale)+' '+cy+'L'+(cx+1*scale)+' '+(cy+3.6*scale)+
       '" fill="none" stroke="'+bg+'" stroke-width="'+s(3.1)+'" stroke-linecap="round" stroke-linejoin="round"/>';
  }else if(kind==="seal"){
    var pts=[];
    for(var i=0;i<10;i++){
      var a=(i/10)*Math.PI*2-Math.PI/2, rr=(i%2===0)?7.6*scale:3.4*scale;
      pts.push((cx+rr*Math.cos(a)).toFixed(1)+","+(cy+rr*Math.sin(a)).toFixed(1));
    }
    g+='<polygon points="'+pts.join(" ")+'" fill="'+bg+'"/>';
  }
  return g;
}

/* ───────── 만화책 + 컷 분할 형태 ───────── */
/* B1. 단행본 표지 + 컷 격자 (책등 라인 + 흰 거터) */
function bookCover(fg,bg){
  return '<rect x="11" y="5" width="42" height="54" rx="5" fill="'+fg+'"/>'+
    '<rect x="16.5" y="5" width="2.6" height="54" fill="'+bg+'"/>'+           /* 책등 */
    '<rect x="23" y="11" width="11" height="14" rx="2" fill="'+bg+'"/>'+       /* 컷 1 */
    '<rect x="37.5" y="11" width="11" height="14" rx="2" fill="'+bg+'"/>'+     /* 컷 2 */
    '<rect x="23" y="29" width="25.5" height="16" rx="2" fill="'+bg+'"/>';     /* 와이드 컷 */
}
/* B2. 펼친 책 + 양면 컷 (현 헤더 마크의 발전형) */
function bookOpen(fg,bg){
  return '<path d="M6 12h20a4 4 0 0 1 4 4v36H10a4 4 0 0 1-4-4V12z" fill="'+fg+'"/>'+
    '<path d="M58 12H38a4 4 0 0 0-4 4v36h20a4 4 0 0 0 4-4V12z" fill="'+fg+'"/>'+
    '<rect x="10.5" y="18" width="15" height="10" rx="1.8" fill="'+bg+'"/>'+
    '<rect x="10.5" y="32" width="15" height="14" rx="1.8" fill="'+bg+'"/>'+
    '<rect x="38.5" y="18" width="15" height="14" rx="1.8" fill="'+bg+'"/>'+
    '<rect x="38.5" y="36" width="15" height="10" rx="1.8" fill="'+bg+'"/>';
}
/* B3. 책 두 권(시리즈) + 컷 */
function bookStack(fg,bg){
  return '<rect x="6" y="12" width="18" height="47" rx="4" fill="'+fg+'"/>'+
    '<rect x="10" y="19" width="10" height="9" rx="1.6" fill="'+bg+'"/>'+
    '<rect x="10" y="32" width="10" height="13" rx="1.6" fill="'+bg+'"/>'+
    '<rect x="28" y="5" width="30" height="54" rx="4.5" fill="'+fg+'"/>'+
    '<rect x="32.5" y="4.9" width="2.4" height="54.2" fill="'+bg+'"/>'+
    '<rect x="38" y="11" width="7.5" height="13" rx="1.8" fill="'+bg+'"/>'+
    '<rect x="48" y="11" width="7.5" height="13" rx="1.8" fill="'+bg+'"/>'+
    '<rect x="38" y="28" width="17.5" height="15" rx="1.8" fill="'+bg+'"/>';
}
/* B4. 페이지 넘김(접힌 코너) + 컷 */
function bookFold(fg,bg){
  return '<path d="M11 9a4 4 0 0 1 4-4h24l14 14v36a4 4 0 0 1-4 4H15a4 4 0 0 1-4-4V9z" fill="'+fg+'"/>'+
    '<path d="M39 5l14 14H43a4 4 0 0 1-4-4V5z" fill="'+bg+'"/>'+
    '<rect x="17" y="12" width="9.5" height="12" rx="1.8" fill="'+bg+'"/>'+
    '<rect x="17" y="28" width="30" height="14" rx="1.8" fill="'+bg+'"/>';
}

function svg(size,inner){return '<svg width="'+size+'" height="'+size+'" viewBox="0 0 64 64">'+inner+'</svg>';}
