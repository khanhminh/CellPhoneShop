<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row3">
	<div id="container">

		<div
			class="tab-wrapper clear ui-tabs ui-widget ui-widget-content ui-corner-all">
			<ul
				class="tab-nav clear ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all"
				role="tablist">
				<li
					class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"
					role="tab" tabindex="0" aria-controls="tab-7"
					aria-labelledby="ui-id-7" aria-selected="true"><a
					href="#tab-7" class="ui-tabs-anchor" role="presentation"
					tabindex="-1" id="ui-id-7">Tab 1</a></li>
				<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1"
					aria-controls="tab-8" aria-labelledby="ui-id-8"
					aria-selected="false"><a href="#tab-8" class="ui-tabs-anchor"
					role="presentation" tabindex="-1" id="ui-id-8">Tab 2</a></li>
				<li class="ui-state-default ui-corner-top ui-state-hover" role="tab"
					tabindex="-1" aria-controls="tab-9" aria-labelledby="ui-id-9"
					aria-selected="false"><a href="#tab-9" class="ui-tabs-anchor"
					role="presentation" tabindex="-1" id="ui-id-9">Tab 3</a></li>
			</ul>
			<div class="tab-container">
				<!-- Tab Content -->
				<div id="tab-7"
					class="tab-content clear ui-tabs-panel ui-widget-content ui-corner-bottom"
					aria-labelledby="ui-id-7" role="tabpanel" aria-expanded="true"
					aria-hidden="false">
					<h2>Vivamuslibero Auguer</h2>
					<p>Tab content number 1</p>
				</div>
				<!-- ## TAB 2 ## -->
				<div id="tab-8"
					class="tab-content clear ui-tabs-panel ui-widget-content ui-corner-bottom"
					aria-labelledby="ui-id-8" role="tabpanel" aria-expanded="false"
					aria-hidden="true" style="display: none;">
					<h2>Vivamuslibero Auguer</h2>
					<p>Tab content number 2</p>
				</div>
				<!-- ## TAB 3 ## -->
				<div id="tab-9"
					class="tab-content clear ui-tabs-panel ui-widget-content ui-corner-bottom"
					aria-labelledby="ui-id-9" role="tabpanel" aria-expanded="false"
					aria-hidden="true" style="display: none;">
					<h2>Vivamuslibero Auguer</h2>
					<p>Tab content number 3</p>
				</div>
				<!-- / Tab Content -->
			</div>
		</div>


	</div>
</div>