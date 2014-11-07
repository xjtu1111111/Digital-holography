function varargout = holography(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @holography_OpeningFcn, ...
                   'gui_OutputFcn',  @holography_OutputFcn, ...
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


% --- Executes just before holography is made visible.
function holography_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Global Variant
handles.lambda  = 0;
handles.dist    = 0;
handles.ccd     = 0;
handles.oriFlag = 0;
handles.bgFlag  = 0;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = holography_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)



% --- Executes on button press in saveBtn.
function saveBtn_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function SaveProject_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function oriPic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oriPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gca,'Visible','off');



% --- Executes during object creation, after setting all properties.
function bgPic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bgPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gca,'Visible','off');
% Hint: place code in OpeningFcn to populate bgPic


% --- Executes during object creation, after setting all properties.
function dhPic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dhPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gca,'Visible','off');
% Hint: place code in OpeningFcn to populate dhPic


% --- Executes on mouse press over axes background.
function oriPic_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to oriPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fn, pn, fi] = uigetfile('*.*', 'ѡ��ͼƬ');
if [fn, pn]
    axes(handles.oriPic);
    set(gca, 'Visible', 'on');
    img = imread([pn fn]);
    imshow(img);
end


% --------------------------------------------------------------------
function oriPanel_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to oriPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fn, pn, fi] = uigetfile({'*.bmp','BMP (*.bmp)';'*.jpg','JPEG (*.jpg)';'*.tif','TIF (*.tif)'}, 'ѡ��ԭͼ');
if [fn, pn]
    axes(handles.oriPic);
    set(gca, 'Visible', 'on');
    img = imread([pn fn]);
    imshow(img);
    handles.oriFlag = [pn, fn];
    guidata(hObject,handles)
end


% --- Executes on mouse press over axes background.
function bgPic_ButtonDownFcn(hObject, eventdata, handles)
[fn, pn, fi] = uigetfile({'*.bmp','BMP (*.bmp)';'*.jpg','JPEG (*.jpg)';'*.tif','TIF (*.tif)'}, 'ѡ�񱳾�ͼ');
if [fn, pn]
    axes(handles.bgPic);
    set(gca, 'Visible', 'on');
    img = imread([pn fn]);
    imshow(img);
    handles.oriFlag = [pn, fn];
    guidata(hObject,handles)
end


% --------------------------------------------------------------------
function bgPanel_ButtonDownFcn(hObject, eventdata, handles)
[fn, pn, fi] = uigetfile('*.*', 'ѡ��ͼƬ');
if [fn, pn]
    axes(handles.bgPic);
    set(gca, 'Visible', 'on');
    img = imread([pn fn]);
    imshow(img);
end

function lambda_Callback(hObject, eventdata, handles)
lambda = str2double(get(hObject, 'String'));
if isnan(lambda)
    set(hObject, 'String', 532.8);
    errordlg('��������ȷ�����֣�', '����');
else
    handles.lambda = lambda;
end
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function lambda_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dist_Callback(hObject, eventdata, handles)
dist = str2double(get(hObject, 'String'));
if isnan(dist)
    set(hObject, 'String', 0);
    errordlg('��������ȷ�����֣�', '����');
else
    handles.dist = dist;
end
guidata(hObject,handles)


function dist_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ccd_Callback(hObject, eventdata, handles)
ccd = str2double(get(hObject, 'String'));
if isnan(ccd)
    set(hObject, 'String', 5);
    errordlg('��������ȷ�����֣�', '����');
else
    handles.ccd = ccd;
end
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function ccd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcBtn.
function calcBtn_Callback(hObject, eventdata, handles)
if (~handles.oriFlag) 
    errordlg('��ѡ��ԭͼ��', '����');
elseif (~handles.bgFlag)
    errordlg('��ѡ�񱳾�ͼ��', '����');
else
    errordlg('��Ҫ�����ˣ�', 'ERROR');
end


