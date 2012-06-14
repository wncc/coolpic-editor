function varargout = project1(varargin)
% PROJECT1 MATLAB code for project1.fig
%      PROJECT1, by itself, creates a new PROJECT1 or raises the existing
%      singleton*.
%
%      H = PROJECT1 returns the handle to a new PROJECT1 or the handle to
%      the existing singleton*.
%
%      PROJECT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT1.M with the given input arguments.
%
%      PROJECT1('Property','Value',...) creates a new PROJECT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project1

% Last Modified by GUIDE v2.5 14-Jun-2012 23:52:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project1_OpeningFcn, ...
                   'gui_OutputFcn',  @project1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before project1 is made visible.
function project1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project1 (see VARARGIN)

% Choose default command line output for project1
handles.output = hObject;
handles.bluevalue=0
handles.redvalue=0
handles.greenvalue=0
handles.green=0
handles.red=0
handles.blue=0
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B=handles.image;
B=255-B;
axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[b a]=uigetfile('*.jpg;*.tif;*.png;*.bmp');
if a==0 & b==0
    return
end
a=strcat(a,b);

axes(handles.axes1)
imshow(a)
q=imread(a);
handles.image=q;
guidata(hObject,handles)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=handles.image2;
J={'*.jpg', 'JPEG picture';...
    '*.png', 'PNG picture';...
    '*.bmp', 'BMP picture';...
    '*.tif', 'TIF picture'};
[a b c]=uiputfile(J,'save your image');
switch c
    case 0
        return
    case 1
        q='.jpg';
    case 2
        q='.png';
    case 3
        q='.bmp';
    case 4
        q='.tif';
end
filename=[b a q];
imwrite(A,filename,q(2:4))


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.5 .5 .5]);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=handles.image;
C=rgb2gray(A);
B(:,:,1)=C;

B(:,:,2)=C;

B(:,:,3)=C;
axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rgbImage = handles.image;
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows columns numberOfColorBands] = size(rgbImage);

%Define the window size.
windowSizeVert = 15;
windowSizeHoriz = 11;
% Initialize an output image.
paintedImage=uint8(zeros([rows-windowSizeVert, columns-windowSizeHoriz, 3]));
%Calculate the histogram for each RGB value.
for colorChannel = 1 : numberOfColorBands
for row = 1: rows - windowSizeVert
for column = 1 : columns - windowSizeHoriz
% Get a little sub-image out.
% The sub-image has it's upper left corner at pixel location i,j.
subImage = rgbImage(row:row+windowSizeVert-1, column:column+windowSizeHoriz-1, colorChannel);
% If you want to see the sub image, uncomment this
% but it slows it down A LOT!
% 			subplot(2, 2, 2);
% 			imshow(subImage);
% 			drawnow;
% Compute the histogram by incrementing values.
histOfWindow = zeros(1,256); % Initialize
for x = 1:(windowSizeVert * windowSizeHoriz)
histOfWindow(subImage(x)+1) = histOfWindow(subImage(x)+1) + 1;
end
% Maximum occurring value and the position is obtained
% for this color channel.
[maxvalue, indexAtMax] = max(histOfWindow);
% Assign the intensity value, which is the index at the max - 1
% since the indexes go from 1-356 but the intensities gto from 0-255.
paintedImage(row,column,colorChannel) = indexAtMax - 1;
end
end
end
B=paintedImage;
axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)





% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=handles.image;
m=6;                                                                   
n=7;
Image=uint8(zeros([size(A,1)-m,size(A,2)-n,3]));

for i=1:size(A,1)-m
    for j=1:size(A,2)-n

        mymask=A(i:i+m-1,j:j+n-1,:);
%Select a pixel value from the neighborhood.
x2=ceil(rand(1)*m);
y2=ceil(rand(1)*n);
    
        Image(i,j,:)=mymask(x2,y2,:);
    end
end
B=Image;
axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)

D=handles.image2;
handles.image=D;
imshow(D);
handles.image=D;
guidata(hObject,handles)



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Infrared Effect
% Take an image as input and read it.
I = handles.image;
% Convert the RGB image into gray image.

C = rgb2gray(I);


X = gray2ind(C, 256);
rgb = ind2rgb(X, hot(256));
axes(handles.axes3)
imshow(rgb)
% false-color
imwrite(rgb, 'x.jpg');
rgb=imread('x.jpg');
handles.image2=rgb;
guidata(hObject,handles)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Winter Effect
% Take an image as input and read it.
I = handles.image;
% Convert the RGB image into gray image.
C = rgb2gray(I);


X = gray2ind(C, 256);
rgb = ind2rgb(X, winter(256));
axes(handles.axes3)
imshow(rgb)
% false-color
imwrite(rgb, 'x.jpg');
rgb=imread('x.jpg');
handles.image2=rgb;
guidata(hObject,handles)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The code of cone effect: 
A=handles.image; 
B=uint8(zeros(size(A)));

%FIND THE MID VALUES 
midx=ceil((size(A,1)+1)/2); 
midy=ceil((size(A,2)+1)/2);

%CHANGE THE VALUE OF 'K' 
K=180;

x2=zeros([size(A,1) size(A,2)]);

y2=zeros([size(A,1) size(A,2)]);

%COMPUTATION TO GET CONE EFFECT 
for i=1:size(A,1)

    x=i-midx;

    for j=1:size(A,2)

      [theta,rho]=cart2pol(x,j-midy);

      sqtrho=sqrt(rho*K);

      [l,m]=pol2cart(theta,sqtrho);

      x2(i,j)=ceil(l)+ midx;

      y2(i,j)=ceil(m)+ midy;
end

end

   % IF THE ARRAY CONTAINS VALUES LESS THAN 1 REPLACE IT WITH 1 AND
   % IF GREATER THAN 1 REPLACE WITH SIZE OF THE ARRAY
   x2(x2<1)=1;
   x2(x2>size(A,1))=size(A,1);

   y2(y2<1)=1;
   y2(y2>size(A,2))=size(A,2);

   for i=1:size(A,1)
       for j=1:size(A,2)
           B(i,j,:)=A(x2(i,j),y2(i,j),:);
       end
   end

axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=handles.image;
axes(handles.axes1)
imshow(A)
B=imcrop(A);

axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)



% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Swirl Effect
% Take an image as input and read it.
A=handles.image;
B=uint8(zeros(size(A)));

%Mid point of the image
midx=ceil((size(A,1)+1)/2);
midy=ceil((size(A,2)+1)/2);

K=10;
x2=zeros([size(A,1) size(A,2)]);
y2=zeros([size(A,1) size(A,2)]);
for i=1:size(A,1)
   x=i-midx-K;
   for j=1:size(A,2)
%Cartesian to Polar co-ordinates
          [theta1,rho1]=cart2pol(x,j-midy+K);
    phi=theta1+(rho1/K);
%Polar to Cartesian co-ordinates
       [l,m]=pol2cart(phi,rho1);
       x2(i,j)=ceil(l)+midx;
       y2(i,j)=ceil(m)+midy;

   end
end

x2=max(x2,1);
x2=min(x2,size(A,1));


y2=max(y2,1);
y2=min(y2,size(A,2));


       for i=1:size(A,1)
           for j=1:size(A,2)
               B(i,j,:)=A(x2(i,j),y2(i,j),:);
           end
       end

axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)



% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Stretch Multichannel Image
%Take the image as input and read it.
I = handles.image;
B = decorrstretch(I,'tol',0.0001);

axes(handles.axes3)
imshow(B)
handles.image2=B;
guidata(hObject,handles)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
   % Checkbox is checked-take appropriate action
   handles.red=1;
else
    handles.red=0;
   % Checkbox is not checked-take appropriate action
end
% Hint: get(hObject,'Value') returns toggle state of checkbox1
guidata(hObject,handles)

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
   % Checkbox is checked-take appropriate action
   handles.green=1;
else
    handles.green=0;
   % Checkbox is not checked-take appropriate action
end
% Hint: get(hObject,'Value') returns toggle state of checkbox2
guidata(hObject,handles)

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
   % Checkbox is checked-take appropriate action
   handles.blue=1;
else
    handles.blue=0;
   % Checkbox is not checked-take appropriate action
end
% Hint: get(hObject,'Value') returns toggle state of checkbox3
guidata(hObject,handles)

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentSliderStep = get(hObject, 'Value') 
handles.redvalue=currentSliderStep*255
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentSliderStep = get(hObject, 'Value') 
handles.greenvalue=currentSliderStep*255
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

currentSliderStep = get(hObject, 'Value')
handles.bluevalue=currentSliderStep*255
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = handles.image;
r=I(:,:,1);
[q,w]=size(r);
s=q*w;
if handles.red==1;
for i=1:1:s
    if r(i)>handles.redvalue
        r(i)=255-r(i);
    end
end
end
I(:,:,1)=r;
g=I(:,:,2);
if handles.green==1;
for i=1:1:s
    if g(i)>handles.redvalue
        g(i)=255-g(i);
    end
end
end
I(:,:,2)=g;
b=I(:,:,3);
if handles.blue==1;
for i=1:1:s
    if b(i)>handles.redvalue
        b(i)=255-b(i);
    end
end
end
I(:,:,3)=b;

axes(handles.axes3)
imshow(I)
handles.image2=I;
guidata(hObject,handles)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
