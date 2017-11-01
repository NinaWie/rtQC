% rtQC --> what to do about file names - do we (all) adhere to SPM's file
% naming convention to make matters easier? 
% shall we shape this into an SPM-compatible toolbox to deal with our UI?

% is rtQC our in-house data management


% Each componenr can ne used on its own


% rtQC_id_artifacts
% Identifies artifacts based on AQUA metrics by comparing each volume to reference data (e.g. the preceding volumes or volumes from a reference/good acquisition using the same sequence). Can get rid of spikes and weird volumes. It can also provide metrics of overall data quality, decomposed into movement metrics, signal metrics …
% Current developers: Joha



% Function name: rtQC_xtc2nii
% 
% Description: This function converts data acquired from the Philips XTC real-time export module (PAR/REC files) to Nifti format.
% 
% Usage: rtNII_volume = rtQC_xtc2nii(xtc_ParRec_volume, template_volume)
% 
% Arguments, inputs and outputs:
% 
% xtc_ParRec_volume ~ Realtime volume dumped by XTC in Par/Rec format
% 
% template_volume ~ a volume acquired using the same scanning sequence that is used as reference to complete missing header attributes
% 
% rtNII_volume ~ typical nii file you can readily use in SPM or other software, corresponding exactly to what you would have gotten if you had exported the data offline into dicom and then converted it to nii using dcm2nii from MRIcro.
% 
% Special notes: not applicable
% 
% Dependencies: dcm2nii from MRIcro
% 
% Contributors: Stavros





% Example 2: Adding a field to the rtQC structure

% Field name: rtQC.rtData

% Description: This field holds the raw real-time data in a 4D matrix. The 1st dimension is X, the 2nd is Y, the 3rd is Z and the 4th is time, according to the “SPM NIfTI voxel space”.

% Modifiable by: This field can be modified by the following functions: rtQC_xtc2nii ; rtQC_read_data ….

% Special notes: not applicable





% so -- for this function things will be: 

% Usage: rtQC.id_artifacts_assessment = rtQC_id_artifacts(rtQC.rtData, options);
%
% Arguments, inputs and outputs:
%
% rtQC.rtData:                  the rt data in 4D matrix
%
% options:                      conditional argument, if not specified will
%                               assume standard values
%
% rtQC.id_artifacts_assessment: struct with diagnostical information
%
% Special notes: not applicable
%
% Dependencies: aqua (provided within package if authors approve)
%
% Contributed by: Johan (26-10-2017)


function id_artifacts_assessment = rtQC_id_artifacts(rtData, varargin)



% QA=aqua(flags)

% OK ... SOOOOoo.... what do we do? What do we get out of this?
% I guess some aqua magick
% buut... also ... maybe some kind of motion assessment? Maybe FDJ, as
% well?




% flags.threshold   = 100;
% flags.eye_remove  = 1;
% flags.n_discard   = 5;
% flags.scans       = [];
% flags.realign     = 0;
% flags.reslice     = 1; %defalt=1
% flags.save_result = 1;
% flags.plot_result = 1;
% flags.save_plot   = 1;
% flags.data        = ... yes. these are the files, as specified with SPM.

% 
% 
% 
% QA=aqua_v3_7TRT(flags);




% this is how I called it:
%
% 
% % get the filenames in order... for 4D
% addpath('/home/toolbox/AquaQuality/aquascripts');
% 
% 
% 
% fid=fopen('/data3/toshare/AMYNF_7T/subcodes.txt','r');
% subcodes={};
% while ~feof(fid)
%     subcodes{end+1} = fgetl(fid);
% end
% fclose(fid);
% 
% conds = {'Practice','Run1','Run2','Run3','Transfer'};
% 
% matlabbatch={};
% flags.data={};
% cd('/data3/toshare/AMYNF_7T/AquaQualityCheck');
% 
% for i_subcode=1:numel(subcodes)
%     subcode=subcodes{i_subcode};
%     
%     for i_cond = 1:numel(conds)
%         cond = conds{i_cond};
%         
%         
%         % change directory - just in case!
%         
%         nvol=260; % we always have 260 vols for AMYNF.
%         img_dir=sprintf('/data3/toshare/AMYNF_7T/%s/functional/%s/',subcode,cond);
%         img_filename=sprintf('a%s_%s.nii',subcode,cond);
% 
%      
%         % and this is the trick.
%         % in principle it would be possible to change aqua to accept a
%         % filename... but that'd break too much. better this way.
%         [files, dirs] = spm_select('ExtFPListRec',img_dir,sprintf('^%s',img_filename),1:nvol);
%         
%         
%         flags.data{i_subcode,i_cond}     = files;
%         % flags.data{1,1}     = files;
% 
% 
% 
%     end
% end
% 
% 
% flags.threshold   = 100;
% flags.eye_remove  = 1;
% flags.n_discard   = 5;
% flags.scans       = [];
% flags.realign     = 0;
% flags.reslice     = 1; %defalt=1
% flags.save_result = 1;
% flags.plot_result = 1;
% flags.save_plot   = 1;
% 
% 
% 
% QA=aqua_v3_7TRT(flags);

 
 
 

