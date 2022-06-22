class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @operacions = Operacion.order(id: :desc)
  end

  def control
    @objetivo_mensual = 20000
    año = 2022
    # 01
    start_date_01 = DateTime.parse("01-01-#{año}")
    end_date_01 = DateTime.parse("31-01-#{año}")
    @operacions_01 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_01, end_date: end_date_01})
    # 02
    start_date_02 = DateTime.parse("01-02-#{año}")
    end_date_02 = DateTime.parse("28-02-#{año}")
    @operacions_02 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_02, end_date: end_date_02})
    # 03
    start_date_03 = DateTime.parse("01-03-#{año}")
    end_date_03 = DateTime.parse("31-03-#{año}")
    @operacions_03 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_03, end_date: end_date_03})
    # 04
    start_date_04 = DateTime.parse("01-04-#{año}")
    end_date_04 = DateTime.parse("30-04-#{año}")
    @operacions_04 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_04, end_date: end_date_04})
    # 05
    start_date_05 = DateTime.parse("01-05-#{año}")
    end_date_05 = DateTime.parse("31-05-#{año}")
    @operacions_05 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_05, end_date: end_date_05})
    # 06
    start_date_06 = DateTime.parse("01-06-#{año}")
    end_date_06 = DateTime.parse("30-06-#{año}")
    @operacions_06 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_06, end_date: end_date_06})
    # 07
    start_date_07 = DateTime.parse("01-07-#{año}")
    end_date_07 = DateTime.parse("31-07-#{año}")
    @operacions_07 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_07, end_date: end_date_07})
    # 08
    start_date_08 = DateTime.parse("01-08-#{año}")
    end_date_08 = DateTime.parse("31-08-#{año}")
    @operacions_08 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_08, end_date: end_date_08})
    # 09
    start_date_09 = DateTime.parse("01-09-#{año}")
    end_date_09 = DateTime.parse("30-09-#{año}")
    @operacions_09 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_09, end_date: end_date_09})
    # 10
    start_date_10 = DateTime.parse("01-10-#{año}")
    end_date_10 = DateTime.parse("31-10-#{año}")
    @operacions_10 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_10, end_date: end_date_10})
    # 11
    start_date_11 = DateTime.parse("01-11-#{año}")
    end_date_11 = DateTime.parse("30-11-#{año}")
    @operacions_11 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_11, end_date: end_date_11})
    # 12
    start_date_12 = DateTime.parse("01-12-#{año}")
    end_date_12 = DateTime.parse("31-12-#{año}")
    @operacions_12 = Operacion.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: start_date_12, end_date: end_date_12})

  end
end
