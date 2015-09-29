#
# Copyright (c) 2014 Red Hat Inc.
#
# This software is licensed to you under the GNU General Public License,
# version 3 (GPLv3). There is NO WARRANTY for this software, express or
# implied, including the implied warranties of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv3
# along with this software; if not, see http://www.gnu.org/licenses/gpl.txt
#

module ArfReportsHelper
  def report_arf_column(event, style = "")
    style = "label-default" if event == 0
    content_tag(:span, event, :class=>'label ' + style)
  end

  def show_logs
    return unless @arf_report.logs.size > 0
    form_tag arf_report_path(@arf_report), :id => 'level_filter', :method => :get, :class => "form form-horizontal" do
      content_tag(:span, _("Show log messages:") + ' ') +
      select(nil, 'level', [[_('All messages'), 'info'],[_('Failed and Othered'), 'warning'],[_('Failed only'), 'error']],
             {}, {:class=>"col-md-1 form-control", :onchange =>"filter_by_level(this);"})
    end
  end

  def result_tag(level)
    tag = case level
          when 'pass'
            "success"
          when 'fail'
            "danger"
          else
            "warning"
          end
    "class='label label-#{tag}'".html_safe
  end
end
