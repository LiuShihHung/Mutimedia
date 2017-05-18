clear all
close all
%% show the obj file at 3D figure
al = fopen('al7KC.obj');
 
vertex_al = fscanf(al,'v %f %f %f %f %f %f\n',[6, Inf])';
faces_al = fscanf(al,'f %f %f %f\n',[3, Inf])';
 
fclose(al);
 
vertex = vertex_al(:,1:3);
 
max_x = max(vertex(: , 1));
max_y = max(vertex(: , 2));
max_z = max(vertex(: , 3));
 
min_x = min(vertex(: , 1));
min_y = min(vertex(: , 2));
min_z = min(vertex(: , 3));
 
 
for i = 1 : length(vertex)
 
    vertex(i , 1) = vertex(i , 1) - ((max_x + min_x) / 2) ;
    vertex(i , 2) = vertex(i , 2) - ((max_y + min_y) / 2) ;
    vertex(i , 3) = vertex(i , 3) - ((max_z + min_z) / 2) ;
end
 
faces = faces_al;
colors = vertex_al(:,4:6);
 
s = length(vertex) ;
 
 
%% Adding the HSV color cylinder onto the same world space as al7KC.obj, and then do some transformation
% (Hint) You can try to combine 2 objects' vertices, faces together
 
 
colors = [colors ; hsv2rgb([0, 0, 1])] ;
 
verts_c= [] ;
topV = [];
botV =[] ;
 
topV = [topV ; 0 0 0.5];
botV = [botV ; 0 0 -0.5];
 
vertex_angle = linspace(0,2*pi , 61);
 
 
for i =  1 : 60
   
    
    x = cos(vertex_angle(i));
    y = sin(vertex_angle(i));
    %disp(x);
    topV = [ topV ; x y 0.5];
    botV = [ botV ; x y -0.5];
    colors = [colors; hsv2rgb([vertex_angle(i) / 2 / pi, 1, 1])];
    
end
 
colors = [colors ; hsv2rgb([0, 1, 0])] ;
 
for i = 1 :60
    
    colors = [colors;  hsv2rgb([vertex_angle(i) / 2 / pi, 1, 0])]; 
 
end
 
topVertIndex_c = s+1 : 1 : s+61;
botVertIndex_c = s+62 : 1 : s+122;
 
 
 
verts_c = [topV ; botV ];
 
for i = 1 : 122
    
    verts_c(i , 2) = verts_c(i ,2) + 2.5;
    verts_c(i , 3) = verts_c(i ,3) - 2.5;
    
end
 
vertex = [vertex ; verts_c] ;
 
 
 
faces_c  = [] ;
 
%% Top faces
 
for i = s+2 : s+60
 
    faces_c = [ faces_c ; s+1 i i+1] ;
    
end
 
    faces_c = [faces_c ; s+1 s+61 s+2];
    
%% Side faces (Your efforts here)
 
 
for i = 2 : 60 
        
    faceVert2_c = topVertIndex_c(i);
    
    faceVert3_c = topVertIndex_c(i+1);
 
    faceVert1_c = botVertIndex_c(i);
   
    faces_c = [ faces_c ; faceVert1_c faceVert2_c  faceVert3_c ];
    
end 
 
    faces_c = [faces_c ; s+2 s+61 s+122];
 
 
for i = 2 : 60
        
    faceVert1_c = topVertIndex_c(i+1);
    faceVert3_c = botVertIndex_c(i);
    faceVert2_c = botVertIndex_c(i+1);
    faces_c = [ faces_c ; faceVert1_c faceVert2_c faceVert3_c ];
    
end
 
     faces_c = [ faces_c ; s+2 s+63 s+122];
 
 
%% Bottom faces
 
 
for i = 63  : 121
 
    faces_c = [ faces_c ; s+62 s+i s+i+1] ;
    
end
 
   faces_c = [ faces_c ; s+62 s+122 s+63];
   
  
   
 faces = [faces ; faces_c] ;
    
    
%figure ; trisurf( faces , vertex(:,1), vertex(:,2), vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0,... 
%   'AmbientStrength', 1.0, 'DiffuseStrength', 0.0, 'SpecularStrength', 0.0);
 
%figure ; trisurf(faces_c,verts_c(:,1),verts_c(:,2),verts_c(:,3),'FaceVertexCData', vertColors_c ,'FaceColor','interp', 'EdgeAlpha', 0,... 
%   'AmbientStrength', 0.1, 'DiffuseStrength', 0.8, 'SpecularStrength', 1.0);
 
%figure ; trisurf(faces_c,verts_c(:,1),verts_c(:,2),verts_c(:,3),'FaceVertexCData', vertColors_c ,'FaceColor','interp', 'EdgeAlpha', 0,... 
%   'AmbientStrength', 0.1, 'DiffuseStrength', 0.8, 'SpecularStrength', 1.0);
 
figure ; trisurf( faces , vertex(:,1), vertex(:,2), vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0,... 
   'AmbientStrength', 0.1, 'DiffuseStrength', 0.8, 'SpecularStrength', 1.0);
 
 
 
%% Lighting (You may need to modify the lighting here)
light('Position',[0.0,2.5,-1.5], 'Style', 'local', 'Visible', 'on');
%light('Position',[0.0,2.5,-1.5], 'Style', 'infinite', 'Visible', 'on');
lighting phong;




