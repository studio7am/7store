<?php
class ControllerCommonFooter extends Controller {   
	protected function index() {
		$this->language->load('common/footer');
		
		$this->data['text_footer'] = sprintf($this->language->get('text_footer'), VERSION);

			if (!$this->user->isLogged() || !isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
			$this->data['logged'] = '';
			} else {			
			$this->data['logged'] = $this->user->getUserName();
			}

			// Call the model that checks the table for the enabled widgets
			$this->load->model('common/admin_circloid_dashboard_editor');

			/* Checks for stored Custom Admin Pages */
			$this->data['is_custom_page'] = FALSE;

			$custom_admin_pages = $this->model_common_admin_circloid_dashboard_editor->getCustomAdminPage();
			if(isset($this->request->get['route'])){
				foreach($custom_admin_pages as $custom_admin_page){
					if($this->request->get['route'] == $custom_admin_page['page_route']){
						$this->data['is_custom_page'] = TRUE;
						continue;
					}
				}
			}
			
		
		if (file_exists(DIR_SYSTEM . 'config/svn/svn.ver')) {
			$this->data['text_footer'] .= '.r' . trim(file_get_contents(DIR_SYSTEM . 'config/svn/svn.ver'));
		}
		
		
			$this->template = 'admin_theme/base5builder_circloid/common/footer.tpl';
			
	
    	$this->render();
  	}
}
?>