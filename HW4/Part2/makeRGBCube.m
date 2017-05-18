clear all; close all; clc;

%% Define Vertices
topVerts = [ 0 1 0; 0 1 1; 1 1 1; 1 1 0];
topVertIndex = [ 1 2 3 4 ];
botVerts = [ 0 0 0; 0 0 1; 1 0 1; 1 0 0];
botVertIndex = [ 5 6 7 8 ];

topV = [];
botV = [];
vertColors_c = [] ;
vertColors_c = [vertColors_c ; hsv2rgb([0, 0, 1])] ;

topV = [topV ; 0 0 0.5];
botV = [botV ; 0 0 -0.5];

vertex_angle = linspace(0,2*pi , 61);

%disp(hsv2rgb([angle(60) / 2 / pi, 1, 1]))

for i = 1 : 60
   
    
    x = cos(vertex_angle(i));
    y = sin(vertex_angle(i));
    %disp(x);
    topV = [ topV ; x y 0.5];
    botV = [ botV ; x y -0.5];
    vertColors_c = [vertColors_c; hsv2rgb([vertex_angle(i) / 2 / pi, 1, 1])];
    
end

vertColors_c = [vertColors_c ; hsv2rgb([0, 1, 0])] ;

for i = 1 :60
    
    vertColors_c = [vertColors_c;  hsv2rgb([vertex_angle(i) / 2 / pi, 1, 0])]; 

end

topVertIndex_c = 1 : 1 : 61;
botVertIndex_c = 62 : 1 : 122;



verts = [ topVerts; botVerts ];

verts_c = [topV ; botV ];


%% Define Colors
vertColors = [ topVerts; botVerts ];
%vertColors_c = [topV ; botV];
%% Empty faces list
faces = [];
faces_c  = [] ;


%% Top faces
faces = [ faces ; 1 2 3 ; 1 3 4 ];

for i = 2 : 60

    faces_c = [ faces_c ; 1 i i+1] ;
    
end

    faces_c = [ faces_c ; 1 61 2];



%% Side faces (Your efforts here)
for vertI = 1 : 4
	faceVert1 = topVertIndex( mod(vertI,4)+1 );
	faceVert2 = topVertIndex( vertI );
	faceVert3 = botVertIndex( vertI );
	faces = [ faces ; faceVert1 faceVert2 faceVert3 ];
end


for vertI = 1 : 4
	faceVert1 = topVertIndex( mod(vertI,4)+1 );
	faceVert2 = botVertIndex( vertI );
	faceVert3 = botVertIndex( mod(vertI,4)+1);
	faces = [ faces ; faceVert1 faceVert2 faceVert3 ];
end


for i = 2 : 60 
        
    faceVert1_c = topVertIndex_c(i);
    
	faceVert2_c = topVertIndex_c(i+1);

	faceVert3_c = botVertIndex_c(i);
   
	faces_c = [ faces_c ; faceVert1_c faceVert2_c  faceVert3_c ];
    
end 

    faces_c = [ faces_c ; 2 61 122];


for i = 2 : 60
        
    faceVert1_c = topVertIndex_c(i+1);
	faceVert2_c = botVertIndex_c(i);
	faceVert3_c = botVertIndex_c(i+1);
	faces_c = [ faces_c ; faceVert1_c faceVert2_c faceVert3_c ];
    
end

     faces_c = [ faces_c ; 2 63 122];


%% Bottom faces
faces = [ faces ; 5 7 6 ; 5 8 7 ];

for i = 63 : 121

    faces_c = [ faces_c ; 62 i i+1] ;
    
end

    faces_c = [ faces_c ; 62 122 63];


   

%disp(faces);

%% Show RGB Cube in 3D figure
figure ; output1 = trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0);

figure ; output2 = trisurf(faces_c,verts_c(:,1),verts_c(:,2),verts_c(:,3),'FaceVertexCData', vertColors_c,'FaceColor','interp', 'EdgeAlpha', 0);



